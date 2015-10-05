class Season < ActiveRecord::Base
  belongs_to :division
  has_many :teams

  def to_s
    self.division.to_s + ', ' + self.name
  end
end
