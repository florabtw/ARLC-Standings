class Game < ActiveRecord::Base

  belongs_to :match
  has_many :performances
  has_one :home_team, through: :match
  has_one :away_team, through: :match

  accepts_nested_attributes_for :performances

  def teams
    [self.home_team, self.away_team]
  end

  def won?(team)
    if home_score > away_score then
      team == self.home_team
    else
      team == self.away_team
    end
  end

  def home_score
    Rails.cache.fetch("#{cache_key}/home_score") do
      season = self.match.home_team.season
      home_performances = self.performances.select { |p| p if p.player.season_team(season) == self.home_team }

      home_performances.sum { |p| p.goals }
    end
  end

  def away_score
    season = self.match.home_team.season
    away_performances = self.performances.select { |p| p if p.player.season_team(season) == self.away_team }

    away_performances.sum { |p| p.goals }
  end

  def to_s
    self.home_team.to_s + ' vs. ' + self.away_team.to_s + ': ' + score
  end

  def score
    home_score.to_s + ' - ' + away_score.to_s
  end
end
