json.extract! booking, :id, :name, :email, :pnr, :seats, :created_at, :updated_at
json.url booking_url(booking, format: :json)
