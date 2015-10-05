class Game < ActiveRecord::Base
  belongs_to :match
  has_many :performances
  has_one :home_team, through: :match
  has_one :away_team, through: :match

  accepts_nested_attributes_for :performances

  def won?(team)
    if home_score > away_score then
      team == self.home_team
    else
      team == self.away_team
    end
  end

  def home_score
    home_performances = self.performances.select { |p| p if self.home_team.players.include? p.player }
    home_performances.sum { |p| p.goals }
  end

  def away_score
    away_performances = self.performances.select { |p| p if self.away_team.players.include? p.player }
    away_performances.sum { |p| p.goals }
  end

  def to_s
    self.home_team.to_s + ' vs. ' + self.away_team.to_s + ': ' + score
  end

  private
    def score
      home_score.to_s + ' - ' + away_score.to_s
    end
end
