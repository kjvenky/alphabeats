class BidsController < ApplicationController

  before_filter :authenticate_user!

  def create
    if current_user.wallet.amount < BigDecimal.new(params[:amount])
      render "low_balance.js.erb"
    else
      @bid = current_user.bids.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], bid_price: (BigDecimal.new(params[:amount])/BigDecimal.new(params[:share])).round(2), open_status: 1)
      if @bid.save
        # byebug
        if does_bid_match_offer?(@bid)
          if make_bid_offer_trade(@bid)
            # redirect_to root_path, :notice => "Your bid has been successfully traded"
            render "create_reload.js.erb" 
          end
        else
          render "create.js.erb" 
        end
      else
        redirect_to root_path, :notice=> "unsuccessful bid"
      end
    end

  end

  def update
      @bid = current_user.bids.find(params[:id])
      @bid.update(share: params[:bid][:share], amount: params[:bid][:amount], bid_price: (BigDecimal.new(params[:bid][:amount])/BigDecimal.new(params[:bid][:share])).round(2))
  end

  def destroy
      @bid = current_user.bids.find(params[:id])
      @bid.destroy
  end

private

  def bid_params
    params.require(:bid).require(:user_id, :song_id, :amount, :share)
  end


  def does_bid_match_offer?(bid)
    # if @bid.bid_price > Bid.where(song_id: @bid.song_id, open_status: 1).order(bid_price: :desc).first.bid_price
    if Offer.where(song_id: bid.song_id, open_status: 1).present?
      return true if bid.bid_price >= Offer.where(song_id: bid.song_id, open_status: 1).order(offer_price: :asc).first.offer_price
    else
      return false
    end
  end

  def make_bid_offer_trade(bid)

    offer = Offer.where(song_id: bid.song_id, open_status: [1,3] ).order(offer_price: :asc).first
    # byebug
    min_share_traded = offer.share < bid.share ? offer : bid
    amount_paid = min_share_traded.share*offer.offer_price

    begin
      ActiveRecord::Base.transaction do
        transactionlog= TransactionLog.create!(amount: amount_paid, transaction_type: TransactionLog::TransactionType::FROM_WALLET, transaction_status: TransactionLog::TransactionStatus::SUCCESS,  user_id: bid.user.id)

        TradeLog.create!(seller_id: offer.user.id, buyer_id: bid.user.id, song_id: bid.song.id, share: min_share_traded.share , amount: amount_paid , transaction_log_id: transactionlog.id )

        #update_wallet
        bid_new_wallet_amount = bid.user.wallet.amount - amount_paid
        bid.user.wallet.update_attributes!(amount: bid_new_wallet_amount)

        offerer_wallet = Wallet.find_by(user_id: offer.user.id)
        offerer_new_wallet_amount = offerer_wallet.amount + amount_paid
        offerer_wallet.update_attributes!(amount: offerer_new_wallet_amount)

        #update_shareholdings
        if !offer.song.shareholders.find_by(user_id: bid.user.id)
            # bidder_shareholder_account = offer.song.shareholders.create!(user_id: bid.user.id, share: 0)
          Shareholder.create!(song_id: offer.song.id, user_id: bid.user.id, share: min_share_traded.share)
        else
          bidder_shareholder_account = offer.song.shareholders.find_by(user_id: bid.user.id)
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
