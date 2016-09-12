class SongStatsController < ApplicationController
  before_action :set_song_stat, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource 

  # GET /song_stats
  # GET /song_stats.json
  def index
    if current_user.admin?
      @song_stats = SongStat.all
      respond_to do |format|
        format.html
        format.csv { send_data @song_stats.to_csv }
      end
    else
      redirect_to root_url, :alert => "You are not authorized to access"
    end
  end

  # GET /song_stats/1
  # GET /song_stats/1.json
  def show
    if current_user.admin?
    else
      redirect_to root_url, :alert => "You are not authorized to access"
    end
  end

  # GET /song_stats/new
  def new
    @song_stat = SongStat.new
  end

  # GET /song_stats/1/edit
  def edit
  end

  # POST /song_stats
  # POST /song_stats.json
  def create
    @song_stat = SongStat.new(song_stat_params)

    respond_to do |format|
      if @song_stat.save
        format.html { redirect_to @song_stat, notice: 'Song stat was successfully created.' }
        format.json { render :show, status: :created, location: @song_stat }
      else
        format.html { render :new }
        format.json { render json: @song_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_stats/1
  # PATCH/PUT /song_stats/1.json
  def update
    respond_to do |format|
      if @song_stat.update(song_stat_params)
        format.html { redirect_to @song_stat, notice: 'Song stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_stat }
      else
        format.html { render :edit }
        format.json { render json: @song_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_stats/1
  # DELETE /song_stats/1.json
  def destroy
    @song_stat.destroy
    respond_to do |format|
      format.html { redirect_to song_stats_url, notice: 'Song stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    SongStat.import(params[:file])
    SongStat.update_stats
    redirect_to song_stats_url, notice: "Song Stats have been imported and stats have been updated individually"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_stat
      @song_stat = SongStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_stat_params
      params.require(:song_stat).permit(:reporting_date, :sale_month, :store, :artist, :title, :quantity, :song_album, :customer_paid, :customer_currency, :country_of_sale, :songwriter_royalties_withheld, :earnings, :song_id)
    end
end
