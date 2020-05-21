class TvshowsController < ApplicationController
  before_action :set_tvshow, only: [:show, :edit, :update, :destroy]
  # GET /tvshows
  # GET /tvshows.json
  def index
    if params[:search].present?
      @tvshows = Tvshow.includes(:channel).where("lower(channels.name) =? OR lower(tvshows.name) = ? ", params["search"].try(:downcase), params["search"].try(:downcase)).references(:channels, :tvshows)
    else
      @tvshows = Tvshow.all
    end
  end

  # GET /tvshows/1
  # GET /tvshows/1.json
  def show
  end

  # GET /tvshows/new
  def new
    @channels = Channel.all
    @tvshow = Tvshow.new
  end

  # GET /tvshows/1/edit
  def edit
    @channels = Channel.all
  end

  # POST /tvshows
  # POST /tvshows.json
  def create
    @tvshow = Tvshow.new(tvshow_params)

    respond_to do |format|
      if @tvshow.save
        format.html { redirect_to @tvshow, notice: 'Tvshow was successfully created.' }
        format.json { render :show, status: :created, location: @tvshow }
      else
        format.html { render :new }
        format.json { render json: @tvshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvshows/1
  # PATCH/PUT /tvshows/1.json
  def update
    respond_to do |format|
      if @tvshow.update(tvshow_params)
        format.html { redirect_to @tvshow, notice: 'Tvshow was successfully updated.' }
        format.json { render :show, status: :ok, location: @tvshow }
      else
        format.html { render :edit }
        format.json { render json: @tvshow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvshows/1
  # DELETE /tvshows/1.json
  def destroy
    @tvshow.destroy
    respond_to do |format|
      format.html { redirect_to tvshows_url, notice: 'Tvshow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvshow
      @tvshow = Tvshow.find(params[:id])
    end

    def channels
      @channels = Channel.all
    end
    def tvshow_params
      params.require(:tvshow).permit(:name, :time, :channel_id)
    end

    # Only allow a list of trusted parameters through.
end
