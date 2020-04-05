class User < ApplicationRecord
  has_many :favourites
  has_many :cars, through: :favourites, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :reviews

  validates :user_name, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: {case_sensitive: false}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
						uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50},
						format: {with: VALID_EMAIL_REGEX}
	has_secure_password
end
