class TransactionLogsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authorize_musician

  def create
    #identify all the db changes i have to make
    #make a call to payment gateway
    #TransactionLogs -> amount, status, transaction_type(from wallet or from card), user_id (From wallet: 1, From Card: 2, To Wallet: 3), 
    # status(success: 1, failure: 2)
    #orders-> update payment_status and save
    #once everthing is done set order session to null
    transactionlog= TransactionLog.create(amount: BigDecimal.new(params[:transaction_logs][:amount]), transaction_type: TransactionLog::TransactionType::FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: current_user.id)
    order = current_order.update_attributes(payment_status: true, transaction_log_id: transactionlog.id) 
    if current_user.wallet.nil?
      new_wallet = Wallet.create(user_id: current_user.id, amount: -BigDecimal.new(params[:transaction_logs][:amount]))

    else
      new_wallet_amount = current_user.wallet.amount - BigDecimal.new(params[:transaction_logs][:amount])
      current_user.wallet.update(amount: new_wallet_amount)
    end
    TransactionLogMailer.transaction_email(current_user, current_order).deliver_now 
    session[:order_id] = nil
    redirect_to transaction_log_path(transactionlog), notice: "Payment has been successful. Your current wallet balance is #{current_user.reload.wallet.amount}USD"
  end

  def show
    @transactionLog = current_user.transaction_logs.find(params[:id])
  end

private
  def transaction_logs_params
    params.require(:transaction_logs).permit(:amount)
  end

end
