class Car < ApplicationRecord
	# has_many :rentals, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_one_attached :image

	# the cars that the user saved
	has_many :user_cars
	has_many :users, through: :user_cars

	# the cars that the user rented
	has_many :user_rents
	has_many :users, through: :user_rents

	validates :model, presence: true, length: { minimum: 3, maximum: 25 }
	validates :rent, presence: true, numericality: {greater_than: 0 }
	validates :productionYear, presence: true, numericality: {greater_than: 1990 }
	validates :seats, presence: true, numericality: {greater_than: 0 }
	validates :discription, presence: true, length: { minimum: 10}
	validates :rank, presence: true, numericality: {greater_than: -1.0, smaller_than: 6.0 }
	validate :check_image_existence



	private
	def check_image_existence
		if image.attached? == false
			errors.add(:image, "is required.")
		end
	end
end
