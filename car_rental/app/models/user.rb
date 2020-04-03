class User < ApplicationRecord
	has_many :favourites
	has_many :rentals
	has_many :reviews
	include BCrypt
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save { self.email = email.downcase }
	attr_reader :password_hash

	validates :email, presence: true
	validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates_confirmation_of :password
	validates :name, presence: true

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("id ASC") }
	scope :newest_first, lambda { order("created_at DESC") }
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
end
