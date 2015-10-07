class SeasonsController < ApplicationController
  before_action :authenticate, except: [:show, :index]
  before_action :set_season, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @division = Division.find(params[:division_id])
    @season = @division.seasons.new
  end

  def edit
  end

  def create
    @division = Division.find(params[:division_id])
    @season = @division.seasons.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to @season, notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to @season, notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    division = @season.division
    @season.destroy
    respond_to do |format|
      format.html { redirect_to division, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_season
      @season = Season.find(params[:id])
    end

    def season_params
      params.require(:season).permit(:name, :division_id)
    end
end
