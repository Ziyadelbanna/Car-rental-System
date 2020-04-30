class Car < ApplicationRecord
	# has_many :rentals, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :rented_cars, dependent: :destroy
	has_one_attached :image

	#has_many :users, through: :rented_cars

	# the cars that the user saved
	has_many :user_cars
	has_many :users, through: :user_cars

	# the cars that the user rented
	# has_many :user_rents
	# has_many :users, through: :user_rents

	validates :model, presence: true, length: { minimum: 3, maximum: 25 }
	validates :rent, presence: true, numericality: {greater_than: 0 }
	validates :productionYear, presence: true, numericality: {greater_than: 1990 }
	validates :seats, presence: true, numericality: {greater_than: 0 }
	validates :discription, presence: true, length: { minimum: 10}
	validates :rank, presence: true, numericality: {greater_than: -1.0, smaller_than: 6.0 }
	validate :check_image_existence


	def calculate_car_rate(car_id)
		# if count is < 1 means that the count is zero so it isn't saved
		car_reviews = reviews.where(car_id: car_id)
		i = 0
		reviews_counter = 0
		valid_reviews = 0
		# logger.info "reviews_counter: #{car_reviews.length}"

		if car_reviews.length > 0
			while i < car_reviews.length
				#logger.info "rank no.#{i} =: #{car_reviews[i].rank}"
				reviews_counter += car_reviews[i].rank

				if car_reviews[i].rank != 0
					valid_reviews += 1
				end

				i = i + 1
			end

			#logger.info "valid_reviews =: #{valid_reviews}"
			# logger.info "reviews_counter =: #{reviews_counter}"
			# calculate avg
			reviews_counter = (reviews_counter / valid_reviews)
		end
		car = Car.find(car_id)
		car.rank = reviews_counter
		car.save
	end



	private
	def check_image_existence
		if image.attached? == false
			errors.add(:image, "is required.")
		end
	end
end
