class ShortlistsController < ApplicationController

  before_filter :authenticate_user!

  # def discover
  #   @songs = Song.all - current_user.shortlist_songs
  # end

  def index
    @songs = current_user.shortlist_songs
  end

  def create
    if !current_user.shortlists.find_by(song_id: params[:song_id])
      @shortlist = current_user.shortlists.new(song_id: params[:song_id])
      @shortlist.save
    else
      render nothing: true
    end
  end

  def destroy

	@shortlist = current_user.shortlists.find_by(params[:id])
    if @shortlist
      @shortlist.destroy
    else
      render nothing: true
    end
  end

end
