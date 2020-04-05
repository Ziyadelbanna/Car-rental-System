require 'test_helper'

class ListCarsTest < ActionDispatch::IntegrationTest

  def setup

    @car = Car.create(model: "gely", rent: 70.0,productionYear: 2021, seats: 4, discription: "The car is good for you",  airconditioned: true, automatic: true)
    @car.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'car','car-2.jpg')), filename: 'car-2.jpg', content_type: 'image/jpg')

    @car2 = Car.create(model: "Ferrari", rent: 200.0,productionYear: 2022, seats: 2, discription: "The car is good for you",  airconditioned: true, automatic: true)
    @car2.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'car','car-3.jpg')), filename: 'car-3.jpg', content_type: 'image/jpg')



  end

  test "should show cars listing" do

    get cars_path

    assert_template 'cars/index'

    # assert_select "a[href=?]", car_path(@car), text: @car.model
    #
    # assert_select "a[href=?]", car_path(@car2), text: @car2.name

  end

end