class OrdersController < ApplicationController

  def update
    current_order.update_attributes(order_params)
  end

  def destroy
  end

private
  def order_params
    params.require(:order).permit(:youtube,:shazam,:total,:store_maximizer)
  end

end
