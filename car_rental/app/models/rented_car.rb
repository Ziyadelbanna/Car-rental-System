class RentedCar < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :car, class_name: "Car"

  validates :rent_from_date, :rent_to_date, availability: true
  validate :end_date_after_start_date

  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :credit_card_no, presence: true, numericality: {greater_than: 99999999999}, length: {minimum: 12, maximum: 12}
  validates :cvc, presence: true, numericality: {greater_than: 99}, length: {minimum: 3, maximum: 3}
  validates :credit_expired_date, presence: true
  #validate :expired_card

  # def is_date_available(car_id)
  #   rents = RentedCar.where(car_id: car_id)
  #   logger.info "new car id: #{car_id}"
  #   logger.info "rents: #{rents.length}"
  #
  #   rents.each { |rent|
  #     if :rent_from_date >= rent.rent_from_date and :rent_to_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     elsif :rent_from_date >= rent.rent_from_date and :rent_from_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     elsif :rent_to_date >= rent.rent_from_date and :rent_to_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     end
  #   }
  #   return TRUE
  # end
  #

  def unavailable_dates
    rented_cars.pluck(:rent_from_date, :rent_to_date).map do |range|
      {from: range[0], to: range[1]}
    end
  end

  # def expired_card
  #   if not credit_expired_date and credit_expired_date < Date.today
  #     errors.add(:credit_expired_date, "Expired date")
  #   end
  # end

  private

  def end_date_after_start_date
    if not rent_from_date and not rent_to_date and rent_to_date < rent_from_date
      errors.add(:rent_to_date, "must be after the start date")
    end
  end

end
