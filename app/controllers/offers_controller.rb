class OffersController < ApplicationController


  before_action :authenticate_user!
  
  def create

    # if current_user.shareholder_songs.find(song_id: params[:song_id]).nil? || current_user.shareholder_songs.find(song_id: params[:song_id]).share < BigDecimal.new(params[:share])
    # if Shareholder.where(song_id: params[:song_id], user_id: current_user.id).empty? || Shareholder.find_by(song_id: params[:song_id], user_id: current_user.id).share < BigDecimal.new(params[:share])
    if shares_exist?
      render "low_share_offer.js.erb"
    else
      @offer = current_user.offers.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], offer_price: (BigDecimal.new(params[:amount])/BigDecimal.new(params[:share])).round(2), open_status: 1)
      if @offer.save
        if does_offer_match_bid?(@offer)
          if make_offer_bid_trade(@offer)
            # redirect_to root_path, :notice => "Your bid has been successfully traded"
            render "create_reload.js.erb" 
          end
        else
          render "create.js.erb" 
        end
      else
        redirect_to root_path, :notice=> "unsuccessful offer"
      end
    end
  end

  def update
      @offer = current_user.offers.find(params[:id])
      @offer.update(share: params[:offer][:share], amount: params[:offer][:amount], offer_price: (BigDecimal.new(params[:offer][:amount])/BigDecimal.new(params[:offer][:share])).round(2))
  end

  def destroy
      @offer = current_user.offers.find(params[:id])
      @offer.destroy
  end

private
  def offer_params
    params.require(:offer).permit(:user_id, :song_id, :share, :amount)
  end

  def shares_exist?
    Shareholder.where(song_id: params[:song_id], user_id: current_user.id).empty? || Shareholder.find_by(song_id: params[:song_id], user_id: current_user.id).share < BigDecimal.new(params[:share])
  end

  def does_offer_match_bid?(offer)
    # if @bid.bid_price > Bid.where(song_id: @bid.song_id, open_status: 1).order(bid_price: :desc).first.bid_price
    if Bid.where(song_id: offer.song_id, open_status: 1).present?
      return true if offer.offer_price <= Bid.where(song_id: offer.song_id, open_status: 1).order(bid_price: :desc).first.bid_price
    else
      return false
    end
  end

  def make_offer_bid_trade(offer)

    bid = Bid.where(song_id: offer.song_id, open_status: [1,3] ).order(bid_price: :desc).first
    # byebug
    min_share_traded = offer.share <= bid.share ? offer : bid
    amount_paid = min_share_traded.share*bid.bid_price

    begin
      ActiveRecord::Base.transaction do
        transactionlog= TransactionLog.create!(amount: amount_paid, transaction_type: TransactionLog::TransactionType::FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: offer.user.id)

        TradeLog.create!(seller_id: offer.user.id, buyer_id: bid.user.id, song_id: bid.song.id, share: min_share_traded.share , amount: amount_paid , transaction_log_id: transactionlog.id )

        #update_wallet
        offer_new_wallet_amount = offer.user.wallet.amount + amount_paid
        offer.user.wallet.update_attributes!(amount: offer_new_wallet_amount)

        bidder_wallet = Wallet.find_by(user_id: bid.user.id)
        bidder_new_wallet_amount = bidder_wallet.amount + amount_paid
        bidder_wallet.update_attributes!(amount: bidder_new_wallet_amount)

        #update_shareholdings
        if !bid.song.shareholders.find_by(user_id: bid.user.id)
            # bidder_shareholder_account = offer.song.shareholders.create!(user_id: offer.user.id, share: 0)
          Shareholder.create!(song_id: bid.song.id, user_id: bid.user.id, share: min_share_traded.share)
        else
          bidder_shareholder_account = bid.song.shareholders.find_by(user_id: bid.user.id)
          bidder_shares = bidder_shareholder_account.share
          bidder_shareholder_account.update_attributes!(share: bidder_shares + min_share_traded.share )
        end
        offer_shareholder_account = offer.song.shareholders.find_by(user_id: offer.user.id)
          offer_shares = offer_shareholder_account.share
        offer_shareholder_account.update_attributes!(share: offer_shares - min_share_traded.share )
        
        #update bid and offer
        if bid.share == min_share_traded
          bid.update_attributes!(open_status: 2)
        else
          updated_bid_share = bid.share-min_share_traded
          bid.update_attributes!(open_status: 3, share: updated_bid_share)
        end

        if offer.share == min_share_traded
          offer.update_attributes!(open_status: 2)
        else
          updated_offer_share = offer.share-min_share_traded
          offer.update_attributes!(open_status: 3, share: updated_offer_share)
        end

      end #End activerecord transaction
    rescue ActiveRecord::RecordInvalid => invalid
      return false
    end #end of begin

    return true
  end

end
