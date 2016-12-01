class Beacon < ActiveRecord::Base
  has_many :discovers, dependent: :destroy
  belongs_to :user , :foreign_key=>[:user_id]
  belongs_to :major_region, :foreign_key=>[:major_id]
  belongs_to :minor_region, :foreign_key=>[:minor_id]
end
