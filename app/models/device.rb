class Device < ActiveRecord::Base
  has_many :discovers
  self.primary_key = 'device_id'
end
