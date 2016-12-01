class Discover < ActiveRecord::Base
  belongs_to :beacon, :foreign_key=>[:beacon_id]
  belongs_to :device, :foreign_key=>[:device_id]
end
