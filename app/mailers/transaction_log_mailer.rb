class TransactionLogMailer < ApplicationMailer
  default from: 's@alphabeatsmusic.com'

  def transaction_email(user, order)
    @user = user
    @order = order.reload
    @transaction_log = order.reload.transaction_log
    @count = order.order_items.count
    @albums = []
    i=@count
    while i>0
      @albums.push(order.order_items[i-1].album)
      i=i-1
    end

    # @order = transactionlog.reload.order
    # @wallet_balance = @user.reload.wallet.amount
    # @album = transactionlog.reload.order.order_items.last.album
    mail(to: @user.email, bcc: 'alphabeatsuploads@gmail.com', subject: 'Details of the album you paid')
  end


end
