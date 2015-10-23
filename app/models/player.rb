class Player < ActiveRecord::Base
  require 'steam-condenser/community'

  has_many :memberships
  has_many :teams, through: :memberships
  has_many :performances

  def season_team(season)
    self.teams.find_by(season: season)
  end

  def goals
    self.performances.reduce(0) { |sum, p| sum + p.goals }
  end

  def team_goals(team)
    team_performances(team).reduce(0) { |sum, p| sum + p.goals }
  end

  def assists
    self.performances.reduce(0) { |sum, p| sum + p.assists }
  end

  def team_assists(team)
    team_performances(team).reduce(0) { |sum, p| sum + p.assists }
  end

  def saves
    self.performances.reduce(0) { |sum, p| sum + p.saves }
  end

  def team_saves(team)
    team_performances(team).reduce(0) { |sum, p| sum + p.saves }
  end

  def shots
    self.performances.reduce(0) { |sum, p| sum + p.shots}
  end

  def team_shots(team)
    team_performances(team).reduce(0) { |sum, p| sum + p.shots }
  end

  def to_s
    self.username
  end

  def steam_name
    if not self.steam_id.blank? then
      begin
        steam_id = SteamId.new self.steam_id
        steam_id.nickname
      rescue
        self.steam_id
      end
    end
  end

  private
    def team_performances(team)
      self.performances.select { |p| p if p.home_team == team || p.away_team == team }
    end
end
