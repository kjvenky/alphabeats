class BidsController < ApplicationController

  before_filter :authenticate_user!

  def create
    if current_user.wallet.amount < BigDecimal.new(params[:amount])
      render "low_balance.js.erb"
    else
      @bid = current_user.bids.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], open_status: 1)
      if @bid.save
        render "create.js.erb" 
      else
        redirect_to root_path, :notice=> "unsuccessful bid"
      end
    end

  end

  def update
      @bid = current_user.bids.find(params[:id])
      @bid.update(share: params[:bid][:share], amount: params[:bid][:amount])
  end

  def destroy
      @bid = current_user.bids.find(params[:id])
      @bid.destroy
  end

private

  def bid_params
    params.require(:bid).require(:user_id, :song_id, :amount, :share)
  end

end
