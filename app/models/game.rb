class Game < ActiveRecord::Base
  belongs_to :match
  has_many :performances
  has_one :home_team, through: :match
  has_one :away_team, through: :match

  accepts_nested_attributes_for :performances

  def to_s
    self.home_team.to_s + ' vs. ' + self.away_team.to_s + ': ' + score
  end

  private
    def score
      home_performances = self.performances.select { |p| p if self.home_team.players.include? p.player }
      away_performances = self.performances.select { |p| p if self.away_team.players.include? p.player }
      home_performances.sum { |p| p.goals }.to_s + ' - ' + away_performances.sum { |p| p.goals }.to_s
    end
end
