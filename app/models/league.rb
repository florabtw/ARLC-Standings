class League < ActiveRecord::Base
  has_many :divisions

  def to_s
    self.name
  end
end
