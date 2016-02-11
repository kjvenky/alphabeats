class TransactionLogMailer < ApplicationMailer
  default to: 'alphabeatsuploads@gmail.com', from: 's@alphabeatsmusic.com'

  def transaction_email(user, order)
    @user = user
    @order = order.reload
    @transaction_log = order.reload.transaction_log
    @album= order.order_items.last.album

    # @order = transactionlog.reload.order
    # @wallet_balance = @user.reload.wallet.amount
    # @album = transactionlog.reload.order.order_items.last.album
    mail(to: @user.email, subject: 'Details of the album you paid')
  end
end
