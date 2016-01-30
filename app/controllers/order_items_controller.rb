class OrderItemsController < ApplicationController

  def create
    # byebug
    if !current_order.order_items.find_by(album_id: params[:album_id])
      @order = current_order
      @order_item = @order.order_items.new(album_id: params[:album_id])
      @order.save
      session[:order_id] = @order.id
    else
      render nothing: true
    end
  end

  def update
    # @order_item = current_order.order_items.update_attributes(order_item_params)
  end

  def destroy
    if !!current_order.order_items.find_by(album_id: params[:album_id])
      @order = current_order
      @order_item = current_order.order_items.find_by(album_id: params[:album_id])
      @order_item.destroy
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:order_id,:album_id)
  end

end
