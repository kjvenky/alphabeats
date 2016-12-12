class PaymentsController < ApplicationController

  def confirm_withdrawl
    session[:amount]=params[:amount]
    session[:paypal_id]=params[:paypal_id]
    if params[:amount].to_f > current_user.wallet.amount
      redirect_to wallet_path, alert: "You cannot withdraw more than the available balance: #{ current_user.reload.wallet.amount}"
    end
  end

  def initiate_withdrawl_email_verification
    @transactionlog = Payment.verify_withdrawl(current_user, current_user.wallet, session[:amount], session[:paypal_id])
    session[:amount]= nil
    session[:paypal_id]= nil
    if @transactionlog
      redirect_to transaction_log_path(@transactionlog), notice: "Please check your email and respond accordingly"
    else
      redirect_to wallet_path, alert: "Withdrawl has been unsuccessful. Please try again"
    end
  end

	def express_checkout
		response = EXPRESS_GATEWAY.setup_purchase(BigDecimal.new(params[:amount])*100,
			ip: request.remote_ip,
			return_url: new_payment_url,
			cancel_return_url: wallet_url,
			currency: "USD",
			allow_guest_checkout: true,
			items: [{name: "Add Money", description: "Adds money to wallet ", amount: BigDecimal.new(params[:amount])*100}]
		)
    # p response
    # puts response
		redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
	end

	def new
		@payment = Payment.new(:express_token => params[:token])
	end

	def create
    # byebug
    wallet_create_if_empty
		# @payment = Payment.build(:express_token => params[:payment][:express_token], :wallet_id => current_user.wallet.id)
		@payment = current_user.wallet.payments.build(:express_token => params[:payment][:express_token])
		# @order.ip = request.remote_ip
    @payment.ip = request.remote_ip

		if @payment.save
			if @payment.purchase # this is where we purchase the order. refer to the model method below
        # new_wallet_amount = current_user.wallet.amount + BigDecimal.new(params[:payment][:amount])
        new_wallet_amount = current_user.wallet.amount + BigDecimal.new(@payment.amount)
        # byebug
        current_user.wallet.update(amount: new_wallet_amount)
        @payment.create_transaction_log(amount: BigDecimal.new(@payment.amount), transaction_type: TransactionLog::TransactionType::FROM_BANK, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: current_user.id)
				redirect_to wallet_path
			else
				render :action => "failure"
			end
		else
			render :action => 'new'
		end
	end

  private

  def payment_params
    params.require(:payment).permit(:express_token)
  end

end
