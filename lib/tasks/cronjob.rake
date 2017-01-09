namespace :cron do
  desc "Handle all the membership subscriptions"
  membership_cron_hash ={ expired_membership_user_list: [], membership_fee_renewal_user_list: [], last_seven_day_reminder_user_list:[],thirty_day_reminder_user_list: [], ten_day_reminder_user_list: [] } 
  albumaddon_cron_hash ={ expired_albumaddon_album_list: [], albumaddon_fee_renewal_album_list: [], last_seven_day_reminder_album_list:[], thirty_day_reminder_album_list: [], ten_day_reminder_album_list: [] } 
  task :membership => :environment do
    Membership.all.each do |membership|
      #Handles expiry
       if membership.next_renewal_date > Date.today && membership.user.musician?
            membership.user.update_attributes!(musician: false) #update muscian status
            membership_cron_hash[:expired_membership_user_list].push(membership.user.id)
            #send email to admin
            #send email to the user informing that he is no longer a paid member but he can participate in trading
       end

      #Handles renewal and deduction
      # if membership.user.wallet.amount >= 20 && Date.today >membership.next_renewal_date >= Date.today -7
      if Date.today > membership.next_renewal_date >= Date.today -7
        if membership.user.wallet.amount >= 20
          ActiveRecord::Base.transaction do
            balance_after_deduction = membership.user.wallet.amount - 20
            membership.user.wallet.update_attributes!(amount: balance_after_deduction)#deduct 20USD from the account
            updated_next_renewal_date = membership.next_renewal_date + 1.since.year
            membership.update_attributes!(next_renewal_date: updated_next_renewal_date )#change the next_renewal_date to next_renewal_date+1.since.year
            membership_cron_hash[:membership_fee_renewal_user_list].push(membership.user.id)
          end
        else
          membership_cron_hash[:last_seven_day_reminder_user_list].push(membership.user.id)
        end
      end

      #Handles reminders
      if membership.next_renewal_date==Date.today-30
          membership_cron_hash[:thirty_day_reminder_user_list].push(membership.user.id)
           # if they have enough balance - send them an information email  with subject titled "Nothing to do"
           # if they do not have enough balance - send them a reminder email with subject tiled "Needs your immediate attention"
      end
      if membership.next_renewal_date==Date.today-10
          membership_cron_hash[:ten_day_reminder_user_list].push(membership.user.id)
          # if they have enough balance - send them an information email with subject titled "Nothing to do"
          # if they do not have enough balance - send them a reminder email with subject tiled "Needs your immediate attention"
      end

    end #Ends ruby membership block

  end #ends task

  desc "Handle all the album addon subscriptions"
  task :albumaddon => :environment do
    AlbumAddon.all.each do |albumaddon|
      #Handles expiry
       if albumaddon.next_renewal_date == Date.today 
          albumaddon_cron_hash[:expired_albumaddon_album_list].push(albumaddon.album.id)
       end
       # if albumaddon.next_renewal_date > Date.today && membership.user.musician?
       #      membership.user.update_attributes!(musician: false) #update muscian status
       #      membership_cron_hash[:expired_membership_user_list].push(membership.user.id)
       #      #send email to admin
       #      #send email to the user informing that he is no longer a paid member but he can participate in trading
       # end

      #Handles renewal and deduction
      if Date.today > albumaddon.next_renewal_date >= Date.today -7  
        if albumaddon.album.musician.wallet.amount >= albumaddon.subscription_item.subscription.transaction_log.amount 
          ActiveRecord::Base.transaction do
            balance_after_deduction = albumaddon.album.musician.wallet.amount - 20
            albumaddon.album.musician.wallet.update_attributes!(amount: balance_after_deduction)#deduct 20USD from the account
            updated_next_renewal_date = albumaddon.next_renewal_date + 1.since.year
            albumaddon.update_attributes!(next_renewal_date: updated_next_renewal_date )#change the next_renewal_date to next_renewal_date+1.since.year
            albumaddon_cron_hash[:albumaddon_fee_renewal_album_list].push(albumaddon.album.id)
          end
        else
        end
      end

      #Handles reminders
      if albumaddon.next_renewal_date==Date.today-30
          albumaddon_cron_hash[:thirty_day_reminder_album_list].push(albumaddon.album.id)
           # if they have enough balance - send them an information email  with subject titled "Nothing to do"
           # if they do not have enough balance - send them a reminder email with subject tiled "Needs your immediate attention"
      end
      if albumaddon.next_renewal_date==Date.today-10
          albumaddon_cron_hash[:ten_day_reminder_album_list].push(albumaddon.album.id)
          # if they have enough balance - send them an information email with subject titled "Nothing to do"
          # if they do not have enough balance - send them a reminder email with subject tiled "Needs your immediate attention"
      end

    end #Ends ruby albumaddon block

  end #Ends Album addon task block


    #Send email to admin
      TransactionLogMailer.transaction_email(membership_cron_hash[:expired_membership_user_list], membership_cron_hash[:membership_fee_renewal_user_list],albumaddon_cron_hash[:expired_albumaddon_album_list], albumaddon_cron_hash[:albumaddon_fee_renewal_album_list]).deliver_now 

end #ends namespace
