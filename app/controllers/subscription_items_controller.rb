class SubscriptionItemsController < ApplicationController

  def create
    if AlbumAddon.find_by(album_id: params[:album_id]).nil?
    # if !current_subscription_order.subscription_items.find_by(album_id: params[:album_id])
      @subscription = current_subscription_order
      @subscription.update_attributes(subscription_type: 'albumaddon')
      # @subscription_item = @subscription.subscription_items.new(album_id: params[:album_id])
      album_addon = AlbumAddon.create(album_id: params[:album_id])
      @subscription_item = @subscription.subscription_items.new(itemable_id: album_addon.id,  itemable_type: 'AlbumAddon')
      # byebug
      @subscription.save
      session[:subscription_id] = @subscription.id
    else
      render nothing: true
    end
  end

  def update
    # @subscription_item = current_subscription_order.subscription_items.update_attributes(subscription_item_params)
  end

  def destroy
      @subscription = current_subscription_order
      @subscription_item = current_subscription_order.subscription_items.find(params[:id])
      @subscription_item.destroy
  end

  private
  def subscription_item_params
    params.require(:subscription_item).permit(:subscription_id,:album_id)
  end

end
