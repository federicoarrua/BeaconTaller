class MinorRegion < ActiveRecord::Base
  self.primary_key = "minor_id"
  has_many :beacons


  validates :description,
  	presence: true,
  	length: {minimum: 10 ,maximum:256}

  validates :minor_id,
  	presence: true,
  	uniqueness: true
end
