class Region < ActiveRecord::Base
  has_many :divisions
  has_many :leagues, through: :divisions

  def to_s
    self.name
  end
end
