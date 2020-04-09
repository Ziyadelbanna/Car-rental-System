class Favourite < ApplicationRecord
  set_primary_keys :car_id, :user_id
  belongs_to :user
  belongs_to :car
end
