class TransactionLogsController < ApplicationController

  def create
    if current_user.wallet.nil?
      new_wallet = Wallet.create(user_id: current_user.id, amount: BigDecimal.new(params[:transaction_logs][:amount])
 )
    else
      new_wallet_amount = current_user.wallet.amount - BigDecimal.new(params[:transaction_logs][:amount])
      current_user.wallet.update(amount: new_wallet_amount)
    end
    redirect_to root_path, notice: "Payment has been successful. Your current wallet balance is #{current_user.wallet.amount}USD"
  end

private
  def transaction_logs_params
    params.require(:transaction_logs).permit(:amount)
  end

end
