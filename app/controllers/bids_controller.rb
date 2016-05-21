class BidsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @bid = current_user.bids.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], open_status: 1)
    if @bid.save
      render "create.js.erb" 
    else
      redirect_to root_path, :notice=> "unsuccessful bid"
    end

  end

  def update
  end

  def destroy
  end

private

  def bid_params
    params.require(:bid).require(:user_id, :song_id, :amount, :share)
  end

end
