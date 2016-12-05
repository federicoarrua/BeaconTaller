json.extract! beacon, :id,:major_id,:minor_id,:description, :created_at, :updated_at
json.url beacon_url(beacon, format: :json)