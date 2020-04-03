class Car < ApplicationRecord
	has_many :favourites
	has_many :rentals
	has_many :reviews
	has_one_attached :image
end
