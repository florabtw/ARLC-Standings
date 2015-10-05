class Team < ActiveRecord::Base
  belongs_to :season
  has_many :memberships
  has_many :players, through: :memberships

  def to_s
    self.name
  end
end
