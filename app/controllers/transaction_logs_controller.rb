class TransactionLogsController < ApplicationController

  def create
    byebug
    if current_user.wallet.nil?
    end
    current_user.wallet = current_user.wallet- params[:transaction_logs][:amount]
    redirect_to root_path, notice: "Payment has been successful"
  end

private
  def transaction_logs_params
    params.require(:transaction_logs).permit(:amount)
  end

end
