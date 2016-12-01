class MajorRegion < ActiveRecord::Base
  self.primary_key = "major_id"
  has_many :beacons
end
