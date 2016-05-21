class OffersController < ApplicationController


  before_filter :authenticate_user!
  
  def create
    @offer = current_user.offers.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], open_status: 1)
    if @offer.save
      render "create.js.erb" 
    else
      redirect_to root_path, :notice=> "unsuccessful offer"
    end
  end

  def update
  end

  def destroy
      @offer = current_user.offers.find(params[:id])
      @offer.destroy
  end

private
  def offer_params
    params.require(:offer).permit(:user_id, :song_id, :share, :amount)
  end

end
