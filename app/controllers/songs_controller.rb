class SongsController < ApplicationController
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song), notice: "The song #{@song.song_title} has been created"
    else
      render "new"
    end
  end

  def show
    @song = Song.find(params[:id])
  end


private
  def song_params
    params.require(:song).permit(:song_title, :song_writer, :album, :stage_band_name, :record_label, :language, :primary_genre, :secondary_genre, :lyrics, :terms, :release_date, :audio_file,  :album_cover, :duration)
  end
end
