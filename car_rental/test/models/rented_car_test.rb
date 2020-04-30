require 'test_helper'

class RentedCarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @rented_car = RentedCar.new(car_id: 2, user_id: 7, credit_card_no: 123412341234, cvc: 123, credit_expired_date: Date.today, rent_from_date: Date.today, rent_to_date: Date.today)
  end


  # test "rented car object should be valid" do
  #   assert @rented_car.valid?
  # end

  test "car should exist" do
    @rented_car.car_id = nil
    assert_not_nil @rented_car.valid?
  end


  test "user should exist" do
    @rented_car.user_id = nil
    assert_not_nil @rented_car.valid?
  end

  test "credit card no should exist" do
    @rented_car.credit_card_no = 0
    assert_not @rented_car.valid?
  end

  test "credit card number should not be too long" do
    @rented_car.credit_card_no = 1111111111111
    assert_not @rented_car.valid?
  end


  test "credit card number should not be too short" do
    @rented_car.credit_card_no = 11111111111
    assert_not @rented_car.valid?
  end

  test "cvc should exist" do
    @rented_car.cvc = 0
    assert_not @rented_car.valid?
  end


  test "cvc should not be too short" do
    @rented_car.cvc = 11
    assert_not @rented_car.valid?
  end

  test "cvc should not be too long" do
    @rented_car.cvc = 1111
    assert_not @rented_car.valid?
  end


  test "credit card expired date should exist " do
    @rented_car.credit_expired_date = nil
    assert_not_nil @rented_car.valid?
  end

  test "credit card expired date should be valid" do
    assert_operator @rented_car.credit_expired_date, :>=, Date.today
  end

  test "rent form date should exist" do
    @rented_car.rent_from_date = nil
    assert_not_nil @rented_car.valid?
  end


  test "rent from date is greater than or equal today" do
    assert_operator @rented_car.rent_from_date, :>=, Date.today
  end

  test "rent to date should exist" do
    @rented_car.rent_to_date = nil
    assert_not_nil @rented_car.valid?
  end

  test "rent to date is greater than or equal today" do
    assert_operator @rented_car.rent_to_date, :>=, Date.today
  end

  test "rent to date should be greater than or equal rent from data" do
    assert_operator @rented_car.rent_to_date, :>=, @rented_car.rent_from_date
  end
end
