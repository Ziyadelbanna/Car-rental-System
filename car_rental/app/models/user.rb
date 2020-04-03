class User < ApplicationRecord
	has_many :favourites
	has_many :rentals
	has_many :reviews
	has_secure_password
	def password_digest=(hashed_psw)
		hashed_password = hashed_psw
	end
end
