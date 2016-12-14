class Beacon < ActiveRecord::Base
  has_many :discovers
  belongs_to :user , :foreign_key=>[:user_id]
  belongs_to :major_region, :foreign_key=>[:major_region_id]
  belongs_to :minor_region, :foreign_key=>[:minor_region_id]

  validates :description,
  	presence: true,
  	length: {minimum: 10 ,maximum:256}

  validates :name, presence: true, uniqueness: true, length: {minimum: 5, maximum:20}

  validates :major_region, presence: true, uniqueness: { scope: [:minor_region_id] }
  validates :minor_region, presence: true
  validates :user_id, presence:true
end
