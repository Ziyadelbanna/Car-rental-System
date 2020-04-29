json.extract! rented_car, :id,:user_id, :car_id,:credit_card_no, :cvc, :credit_expired_date, :rent_from_date, :rent_to_date, :created_at, :updated_at
json.url rented_car_url(rented_car, format: :json)
