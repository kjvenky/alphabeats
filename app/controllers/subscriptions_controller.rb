class SubscriptionsController < ApplicationController

  def update
    current_subscription.update_attributes(subscription_params)
  end

  def destroy
  end

private
  def subscription_params
    params.require(:subscription).permit(:youtube,:shazam,:total,:store_maximizer)
  end

end
