json.extract! review, :id, :user_id, :car_id, :rank, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
