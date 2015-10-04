class Season < ActiveRecord::Base
  belongs_to :division

  def to_s
    self.name
  end
end
