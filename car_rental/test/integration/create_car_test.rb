require 'test_helper'

class CreateCarsTest < ActionDispatch::IntegrationTest

  # test "get new car form and create car" do
  #
  #   get new_car_url
  #
  #   assert_template 'cars/new'
  #
  #   assert_difference 'Car.count', 1 do
  #     post cars_path, params: { car: {airconditioned: false, automatic: false, model: "BMW", rent: 100.0,productionYear: 2020, seats: 4, discription: "The car is good for you",image:  } }
  #     follow_redirect!
  #   end
  #
  #   assert_template 'cars/show'
  #     #assert_match "sports", response.body
  # end


  test "invalid car submission results in failure" do

    get new_car_path

    assert_template 'cars/new'

    assert_no_difference 'Car.count' do
      post cars_path, params:{ car: {model: " "} }
    end

    assert_template 'cars/new'

      # assert_select 'div.error_explanation'

  end

end