require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @car = Car.new(model: "BMW", rent: 100.0,productionYear: 2020, seats: 4, discription: "The car is good for you",  airconditioned: false, automatic: false)
    @car.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'car','car-1.jpg')), filename: 'car-1.jpg', content_type: 'image/jpg')
  end

  test "car should be valid" do
    assert @car.valid?
  end

  test "name should be present" do
    @car.model = " "
    assert_not @car.valid?
  end

  test "name should not be too short" do
    @car.model = "aa"
    assert_not @car.valid?
  end

  test "name should not be too long" do
    @car.model = "a" * 26
    assert_not @car.valid?
  end

  test "rent should be greater than zero" do
    assert_operator @car.rent, :>, 0.0
  end

  test "productionYear should be present" do
    @car.productionYear = nil
    assert_not_nil @car.valid?
  end

  test "productionYear should be greater than 1990" do
    assert_operator @car.productionYear, :>, 1900

  end

  test "seats should be present" do
    @car.seats = nil
    assert_not_nil @car.valid?
  end

  test "seats should be greater than zero" do
    assert_operator @car.seats, :>, 0
  end

  test "discription should be present" do
    @car.discription = " "
    assert_not @car.valid?
  end

  test "rank should not be negative" do
    assert_operator @car.rank, :>=, 0.0
  end

  test "rank should not be greater than five" do
    assert_operator @car.rank, :<, 6.0
  end

  # test "image should not be nil" do
  #   @car.image = nil
  #   assert_not_nil @car.valid?
  # end

end
