class RentedCar < ApplicationRecord
  belongs_to :user
  belongs_to :rentedcar, class_name: 'Car'
end
