class Season < ActiveRecord::Base
  belongs_to :division
  has_many :teams

  def matches
    Match.all.select { |m| m if m.home_team.season == self }
  end

  def to_s
    self.division.to_s + ', ' + self.name
  end
end
