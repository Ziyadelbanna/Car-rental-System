json.extract! rental, :id, :user_id, :car_id, :start_date, :end_date, :cost, :created_at, :updated_at
json.url rental_url(rental, format: :json)
