class Beacon < ActiveRecord::Base
  has_many :discovers, dependent: :destroy
  belongs_to :user , :foreign_key=>[:user_id]
  belongs_to :major_region, :foreign_key=>[:major_id]
  belongs_to :minor_region, :foreign_key=>[:minor_id]

  validates :description,
  	presence: true,
  	length: {minimum: 10 ,maximum:256}

  validates :name, presence: true, uniqueness: true

  validates :major_region, presence: true, uniqueness: { scope: [:minor_id] }
  validates :minor_region, presence: true
end
