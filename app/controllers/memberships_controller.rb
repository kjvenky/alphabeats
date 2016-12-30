class MembershipsController < ApplicationController

  def create
    if Membership.find_by(user_id: current_user.id).nil?
      @membership = Membership.create(user_id: current_user.id, renewal_status: "active", start_date: Date.today, next_renewal_date: 1.year.since)
      current_user.update_attributes(musician: true)
      redirect_to membership_path, notice: "You are now a paid member of alphabeats. You have now access to the following features!"
    else
      redirect_to membership_path, notice: "You have been a subscriber previously. Contact support and mention the same"
    end
  end

end
