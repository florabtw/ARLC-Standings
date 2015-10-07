class Division < ActiveRecord::Base
  belongs_to :league
  belongs_to :region
  has_many :seasons

  def self.divisions_for(league, region)
    Division
      .where(league: league)
      .where(region: region)
  end

  def meta_info
    [
      self.region.name,
      self.league.name,
      self.name
    ].join(' - ')
  end

  def to_s
    self.name
  end
end
