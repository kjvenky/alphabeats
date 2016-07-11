# == Schema Information
#
# Table name: payments
#
#  id               :integer          not null, primary key
#  express_token    :string
#  express_payer_id :string
#  wallet_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Payment < ActiveRecord::Base

  attr_accessor :name, :country, :email, :phone, :address, :shipping, :amount, :ip
  belongs_to :wallet

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

    private

    def express_purchase_options
      {
        :ip => ip,
        :token => express_token,
        :payer_id => express_payer_id
      }
    end

end
