class SongsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_musician
  
  def index
    @songs = current_user.songs
  end

  def new
    @song = current_user.songs.new
    default_list = [OpenStruct.new({code: -2, text: "No Album(Single)"}), OpenStruct.new({code: -1, text: "Create New Album"})]
    dynamic_list = current_user.albums.collect {|album| OpenStruct.new({code: album.id, text: album.album_name}) }
    @song_album_list = default_list + dynamic_list
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
    params.require(:song).permit(:song_title, :song_writer, :lyrics, :terms, :audio_file,  :duration, :note_to_admin, :album_id, :explicit_lyrics)
  end

end
