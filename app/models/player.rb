class Player < ActiveRecord::Base
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :performances

  def to_s
    self.username
  end
end
