json.extract! user, :id, :user_name, :password_digest, :email, :name, :address, :dob, :age, :points, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
