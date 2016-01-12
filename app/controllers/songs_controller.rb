class SongsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @songs = current_user.songs
  end

  def new
    @song = current_user.songs.new
  end
  
  def create
    @song = current_user.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song), notice: "The song #{@song.song_title} has been created"
    else
      render "new"
    end
  end

  def show
    @song = current_user.songs.find(params[:id])
  end

  def edit
    @song = current_user.songs.find(params[:id])
  end

  def update
    @song = current_user.songs.find(params[:id])
    if @song.update_attributes(song_params)
      redirect_to song_path(@song), notice: "The song #{@song.song_title} has been updated"
    else
      render "edit"
    end
  end

private
  def song_params
    params.require(:song).permit(:song_title, :song_writer, :lyrics, :terms, :audio_file,  :duration, :note_to_admin, :album_id)
  end
end
