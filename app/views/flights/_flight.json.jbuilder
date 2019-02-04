json.extract! flight, :id, :name, :type, :from, :destination, :start_time, :end_time, :fpnr, :created_at, :updated_at
json.url flight_url(flight, format: :json)
