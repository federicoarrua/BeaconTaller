class Discover < ActiveRecord::Base
  belongs_to :beacon, :foreign_key=>[:beacon_id]
  belongs_to :device, :foreign_key=>[:device_id]
  belongs_to :minor_region, :foreign_key=>[:minor_id]
  belongs_to :major_region, :foreign_key=>[:major_id]

  validates :device,	presence: true
  validates :minor_region,	presence: true
  validates :major_region,	presence: true

end
