class Performance < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  has_one :match, through: :game

  after_initialize :init_stats

  def init_stats
    if new_record?
      self.goals   ||= 0
      self.assists ||= 0
      self.saves   ||= 0
      self.shots   ||= 0
    end
  end

  def to_s
    result = ''
    result += self.player.to_s
    result += ': '
    result += self.goals.to_s
    result += ' '
    result += self.assists.to_s
    result += ' '
    result += self.saves.to_s
    result += ' '
    result += self.shots.to_s
    result
  end
end
