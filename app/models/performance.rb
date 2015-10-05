class Performance < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

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
