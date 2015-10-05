class StandingsController < ApplicationController
  def index
    @standings = Team.all
  end
end
