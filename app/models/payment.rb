# == Schema Information
#
# Table name: payments
#
#  id                 :integer          not null, primary key
#  express_token      :string
#  express_payer_id   :string
#  wallet_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  transaction_log_id :integer
#  paypal_id          :string
#  payment_type       :integer
#

PAYMENT_TYPE = { 1 => 'deposit', 2=> 'withdrawl'}
class Payment < ActiveRecord::Base

  attr_accessor :name, :country, :email, :phone, :address, :shipping, :amount, :ip
  belongs_to :wallet
  belongs_to :transaction_log
  validates_numericality_of  :payment_type

    def purchase
      response = EXPRESS_GATEWAY.purchase(BigDecimal.new(self.amount)*100, express_purchase_options)
      # self.wallet.update(amount: new_wallet_amount)
      # cart.update_attribute(:purchased_at, Time.now) if response.success?
      response.success?
    end

    def express_token=(token)
      self[:express_token] = token
      if new_record? && !token.blank?
        # you can dump details var if you need more info from buyer
        details = EXPRESS_GATEWAY.details_for(token)
        self.express_payer_id = details.payer_id
        self.name = details.name
        self.country = details.info["Address"]["CountryName"]
        self.email = details.params["payer"]
        self.amount = details.params["amount"]
        self.phone = details.contact_phone
        self.address = details.address
        self.shipping = details.shipping
      end
    end

    def get_payment_type
      PAYMENT_TYPE[self.payment_type]
    end

    module PaymentType
      DEPOSIT = 1
      WITHDRAWL = 2
    end

    def self.verify_withdrawl(user, wallet, amount, paypal_id)
      begin
        ActiveRecord::Base.transaction do
          @transactionLog= TransactionLog.create!(amount: amount.to_f, transaction_type: TransactionLog::TransactionType::WITHDRAWL_FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::PENDING,  user_id: user.id)
          Payment.create!(wallet_id: wallet.id, transaction_log_id: @transactionLog.id, paypal_id: paypal_id, payment_type: PaymentType::WITHDRAWL)
          new_wallet_amount = wallet.amount - amount.to_f
          wallet.update_attributes!(amount: new_wallet_amount)
        end
      rescue ActiveRecord::RecordInvalid => invalid
        return false
      end #end of begin
      # TransactionLogMailer.transaction_email(current_user, current_order).deliver_now 
      return @transactionLog
    end

    private

    def express_purchase_options
      {
        :ip => ip,
        :token => express_token,
        :payer_id => express_payer_id
      }
    end

end
