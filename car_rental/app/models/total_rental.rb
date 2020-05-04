class TotalRental < ApplicationRecord
  belongs_to :user, class_name: "User"	
  belongs_to :car, class_name: "Car"

  validates :rent_from_date, :rent_to_date, availability: true
  validate :end_date_after_start_date

  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :credit_card_no, presence: true, numericality: {greater_than: 99999999999}, length: {minimum: 12, maximum: 12}
  validates :cvc, presence: true, numericality: {greater_than: 99}, length: {minimum: 3, maximum: 3}
  validates :credit_expired_date, presence: true

  private

  def end_date_after_start_date
    if not rent_from_date and not rent_to_date and rent_to_date < rent_from_date
      errors.add(:rent_to_date, "must be after the start date")
    end
  end




end
