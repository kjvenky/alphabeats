class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @albums = current_user.albums.all.select { |album| !album.order_items.last.nil? && album.order_items.last.order.payment_status }
    @albums = @user.albums
    # @song_count = current_user.songs.count
    @song_count = @user.songs.count
  end

  def update
    # @song = current_user.songs.find(params[:id])
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "The user #{@user.first_name} has been updated"
    else
      render "show", notice: "The user #{@user.first_name} could not be updated"
    end
  end

  def edit
    @user = User.find(params[:id])
    @song_count = @user.songs.count
  end

private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :username, :profile_photo, :stage_name, :hometown, :country, :facebook, :soundcloud, :youtube)
  end

end
