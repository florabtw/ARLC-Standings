class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :match_status
  has_many :games

  def won?(team)
    home_wins = self.games.select { |g| g if g.won? self.home_team }.size
    away_wins = self.games.size - home_wins

    if home_wins > away_wins then
      team == self.home_team
    else
      team == self.away_team
    end
  end

  def to_s
    self.home_team.to_s + ' vs. ' + self.away_team.to_s
  end
end
