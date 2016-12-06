class MajorRegion < ActiveRecord::Base
  self.primary_key = "major_id"
  has_many :beacons

  validates :description,
  	presence: true,
  	length: {minimum: 10 ,maximum:256}

  validates :major_id,
  	presence: true,
  	uniqueness: true
end
