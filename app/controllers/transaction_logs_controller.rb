class TransactionLogsController < ApplicationController

  before_action :authenticate_user!
  # before_filter :authorize_admin_or_user
  before_action :authorize_musician

  def create
    #identify all the db changes i have to make
    #make a call to payment gateway
    #TransactionLogs -> amount, status, transaction_type(from wallet or from card), user_id (From wallet: 1, From Card: 2, To Wallet: 3), 
    # status(success: 1, failure: 2)
    #orders-> update payment_status and save
    #once everthing is done set order session to null
    
    
    if current_user.wallet.amount <  BigDecimal.new(params[:transaction_logs][:amount])
      redirect_to wallet_path, notice: "Please add #{current_user.wallet.amount-BigDecimal.new(params[:transaction_logs][:amount])+2}USD to the wallet"
    else
      # transactionlog= TransactionLog.create(amount: BigDecimal.new(params[:transaction_logs][:amount]), transaction_type: TransactionLog::TransactionType::FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: current_user.id)
      # subscription = current_subscription_order.update_attributes(payment_status: true, transaction_log_id: transactionlog.id) 
      subscription = current_subscription_order.update_attributes(payment_status: true) 
      transactionlog= current_subscription_order.create_transaction_log(amount: BigDecimal.new(params[:transaction_logs][:amount]), transaction_type: TransactionLog::TransactionType::FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: current_user.id)
      if current_user.wallet.nil?
        new_wallet = Wallet.create(user_id: current_user.id, amount: -BigDecimal.new(params[:transaction_logs][:amount]))

      else
        new_wallet_amount = current_user.wallet.amount - BigDecimal.new(params[:transaction_logs][:amount])
        current_user.wallet.update(amount: new_wallet_amount)
      end
      create_shareholders
      TransactionLogMailer.transaction_email(current_user, current_subscription_order).deliver_now 
      session[:subscription_id] = nil
      redirect_to transaction_log_path(transactionlog), notice: "Payment has been successful. Your current wallet balance is #{current_user.reload.wallet.amount}USD"
    end
  end

  def show
    @transactionLog = TransactionLog.find(params[:id])
  end

private
  def transaction_logs_params
    params.require(:transaction_logs).permit(:amount)
  end
  
  def create_shareholders
    if !current_subscription_order.subscription_items.nil?
       current_subscription_order.subscription_items.each do |subscription_item|
         subscription_item.album.songs.each do |s|
           Shareholder.create(song_id: s.id, user_id: s.musician.id, share: 100) if s.shareholders.empty?
         end
       end
    end
  end

end
