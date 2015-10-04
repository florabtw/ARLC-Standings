class Division < ActiveRecord::Base
  belongs_to :league
  belongs_to :region
  has_many :seasons

  def to_s
    self.name
  end
end
