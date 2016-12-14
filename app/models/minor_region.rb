class MinorRegion < ActiveRecord::Base
  self.primary_key = "minor_id"
  belongs_to :user , :foreign_key=>[:user_id]
  has_many :beacons, dependent: :destroy

  validates_numericality_of :minor_id, :only_integer => true, :greater_than_or_equal_to => 1

  validates :description,
  	presence: true,
  	length: {minimum: 10 ,maximum:256}

  validates :minor_id,
  	presence: true,
  	uniqueness: true

  validates :user_id, presence: true
end
