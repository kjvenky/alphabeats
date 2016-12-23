class TransactionLogMailer < ApplicationMailer
  default from: "\"Alphabeats\" <s@alphabeatsmusic.com>"

  def transaction_email(user, subscription)
    @user = user
    @subscription = subscription.reload
    @transaction_log = subscription.reload.transaction_log
    @count = subscription.subscription_items.count
    @albums = []
    i=@count
    while i>0
      @albums.push(subscription.subscription_items[i-1].itemable.album)
      i=i-1
    end

    # @subscription = transactionlog.reload.subscription
    # @wallet_balance = @user.reload.wallet.amount
    # @album = transactionlog.reload.subscription.subscription_items.last.album
    mail(to: @user.email, bcc: 'alphabeatsuploads@gmail.com', subject: 'Details of the album you paid')
  end

  def destroy_paid_album_email(user, album)
    @user = user
    @album = album
    @song_count = album.songs.count
    mail(to: @user.email, bcc: 'alphabeatsuploads@gmail.com', subject: 'Details of the paid album you deleted')
  end

  def withdrawl_email(user, transactionLog, payment) 
    @user = user
    @transactionLog= transactionLog
    @paypal_id= payment.paypal_id
    @withdrawl_amount= transactionLog.amount
    @balance= user.wallet.amount
    @email= user.email 
    mail(to: @user.email, bcc: 'alphabeatsuploads@gmail.com', subject: "Tx id: #{transactionLog.id} Withdrawl Request Confirmation")
  end


end
