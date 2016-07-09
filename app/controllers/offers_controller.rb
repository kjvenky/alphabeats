class OffersController < ApplicationController


  before_filter :authenticate_user!
  
  def create

    # if current_user.shareholder_songs.find(song_id: params[:song_id]).nil? || current_user.shareholder_songs.find(song_id: params[:song_id]).share < BigDecimal.new(params[:share])
    # if Shareholder.where(song_id: params[:song_id], user_id: current_user.id).empty? || Shareholder.find_by(song_id: params[:song_id], user_id: current_user.id).share < BigDecimal.new(params[:share])
    if shares_exist?
      render "low_share_offer.js.erb"
    else
      @offer = current_user.offers.new(share: params[:share], amount: params[:amount], song_id: params[:song_id], offer_price: (BigDecimal.new(params[:amount])/BigDecimal.new(params[:share])).round(2), open_status: 1)
      if @offer.save
        render "create.js.erb" 
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

end
