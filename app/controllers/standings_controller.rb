class StandingsController < ApplicationController
  def index
    @seasons = Season.all
  end
end
