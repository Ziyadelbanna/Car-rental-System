class SavedCar < ApplicationRecord
  belongs_to :user
  belongs_to :savedcar, class_name: 'Car'
end
