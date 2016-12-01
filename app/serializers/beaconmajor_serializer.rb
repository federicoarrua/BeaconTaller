class BeaconSerializer < ActiveModel::Serializer
  attributes :id, :minor, :description, :lat, :lng
end
