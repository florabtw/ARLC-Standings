class Game < ActiveRecord::Base
  belongs_to :match
  has_many :performances

  accepts_nested_attributes_for :performances
end
