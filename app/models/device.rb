class Device < ActiveRecord::Base
  has_many :discovers
  self.primary_key = 'device_id'
  
  validates :device_id,
  	presence: true,
	uniqueness: true

  validates :mail,
  	presence: true,
	uniqueness: true
end
