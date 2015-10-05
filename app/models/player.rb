class Player < ActiveRecord::Base
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :performances

  def goals
    self.performances.reduce(0) { |sum, p| sum + p.goals }
  end

  def assists
    self.performances.reduce(0) { |sum, p| sum + p.assists }
  end

  def saves
    self.performances.reduce(0) { |sum, p| sum + p.saves }
  end

  def shots
    self.performances.reduce(0) { |sum, p| sum + p.shots}
  end

  def to_s
    self.username
  end
end
