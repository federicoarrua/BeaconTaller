json.extract! device, :device_id,:mail, :created_at, :updated_at
json.url device_url(device, format: :json)