class MinorRegion < ActiveRecord::Base
  self.primary_key = "minor_id"
  has_many :beacons
end
