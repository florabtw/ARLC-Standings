class Division < ActiveRecord::Base
  belongs_to :league
  belongs_to :region

  def to_s
    self.name
  end
end
