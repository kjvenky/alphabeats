class AlbumsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :album_song_show]
  # before_filter :authorize_admin_or_user
  before_action :authorize_musician, except: [:show, :album_song_show]


  load_and_authorize_resource :only => [:show,:album_song_show]
  def index
    @albums = current_user.albums.all
    @paid_albums = current_user.albums.all.select { |album| !album.order_items.last.nil? && album.order_items.last.order.payment_status }
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = current_user.albums.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      redirect_to album_path(@album), notice: "An album name #{@album.album_name} has been created. You can now go to song upload page and select #{@album.album_name} from the dropdown of the song upload page to add songs"
    else
      render "new"
    end
  end

  def update

    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_path(@album), notice: "The album #{@album.album_name} has been updated"
    else
      render "edit"
    end
  end

  def destroy
  end

  def album_song_show
    @album = Album.find(params[:id])
  end

private
  def album_params
    params.require(:album).permit(:album_name, :stage_band_name, :release_date, :record_label, :album_cover, :language, :primary_genre, :secondary_genre, :spotify, :itunes, :apple_music, :google_play, :amazon, :r_dio, :deezer, :tidal, :youtube, :microsoft_groove, :media_net)
  end

end
