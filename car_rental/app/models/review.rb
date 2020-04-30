class Review < ApplicationRecord
  belongs_to :user
  belongs_to :car


  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :rank, presence: true, numericality: {greater_than: -1, smaller_than: 6}
  validates :content, presence: true, length: {minimum: 1, maximum: 4294967296}


end