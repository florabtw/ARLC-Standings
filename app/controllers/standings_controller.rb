class StandingsController < ApplicationController
  caches_action :index, expires_in: 1.hour

  def index
    @seasons = Season.all
  end
end
