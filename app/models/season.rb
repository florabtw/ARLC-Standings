class Season < ActiveRecord::Base
  belongs_to :division
  has_many :teams

  def matches
    Match.all.select { |m| m if m.home_team.season == self }
  end

  def ordered_teams
    self.teams.sort_by { |t| [-t.wins, -t.goal_difference, -t.goals_for] }
  end

  def meta_info
    [
      self.division.region.name,
      self.division.league.name,
      self.division.name,
      self.name
    ].join(' - ')
  end

  def to_s
    self.division.to_s + ', ' + self.name
  end
end
