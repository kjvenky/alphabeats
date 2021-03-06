class SongsController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :authorize_musician, except: :show

  
  def index
    @songs = current_user.songs
  end

  def new
    @song = current_user.songs.new
    @song_album_list = song_album_list #Defined in application controller
  end
  
  def create
    @song = current_user.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song), notice: "The song #{@song.song_title} has been created"
    else
      @song_album_list = song_album_list #Defined in application controller 
      # and makes sure album field is prepopulated properly when there is an error in the form
      render :action => "new"
    end
  end

  def show
    if user_signed_in?
      @song = current_user.songs.find(params[:id])
    else
      @song = Song.find(params[:id])
    end
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
    params.require(:song).permit(:song_title, :song_writer, :lyrics, :terms, :audio_file,  :duration, :note_to_admin, :album_id, :explicit_lyrics, :self_written, :original_artist, :original_song_title)
  end

end
