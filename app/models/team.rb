class Team < ActiveRecord::Base
  belongs_to :season
  has_many :memberships
  has_many :players, through: :memberships

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  def to_s
    self.name
  end
end
