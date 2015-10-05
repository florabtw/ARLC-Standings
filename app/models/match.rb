class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :match_status
  has_many :games

  def to_s
    self.home_team.to_s + ' vs. ' + self.away_team.to_s
  end
end
