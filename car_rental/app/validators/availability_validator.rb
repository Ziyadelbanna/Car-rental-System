class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    rents = RentedCar.where(["car_id =?", record.car_id])
    # Rails.logger.info "value: #{value}"
    # Rails.logger.info "att: #{attribute}"
    # Rails.logger.info "record: #{record}"
    rents.each do |rent|
      if record.rent_from_date >= rent.rent_from_date and record.rent_to_date <= rent.rent_to_date
        record.errors.add(attribute, "not available from #{rent.rent_from_date} to #{rent.rent_to_date}")
      elsif record.rent_from_date >= rent.rent_from_date and record.rent_from_date <= rent.rent_to_date
        record.errors.add(attribute, "not available from #{rent.rent_from_date} to #{rent.rent_to_date}")
      elsif record.rent_to_date >= rent.rent_from_date and record.rent_to_date <= rent.rent_to_date
        record.errors.add(attribute, "not available from #{rent.rent_from_date} to #{rent.rent_to_date}")
      end
    end



    # date_ranges = rents.map { |b| b.rent_from_date..b.rent_to_date }
    #
    # date_ranges.each do |range|
    #   if range.include? value
    #     record.errors.add(attribute, "not available")
    #   end
    # end
  end
end
