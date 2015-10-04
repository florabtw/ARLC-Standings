class League < ActiveRecord::Base
  has_many :divisions
  has_many :regions, through: :divisions

  def to_s
    self.name
  end
end
