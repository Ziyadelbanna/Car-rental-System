require 'test_helper'

class RentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent = rents(:one)
  end

  test "should get index" do
    get rentedCaredCars_url
    assert_response :success
  end

  test "should get new" do
    get new_rentedCar_url
    assert_response :success
  end

  test "should create rent" do
    assert_difference('RentedCar.count') do
      post rentedCaredCars_url, params: {rent: {  } }
    end

    assert_redirected_to rentedCar_url(RentedCar.last)
  end

  test "should show rent" do
    get rentedCar_url(@rent)
    assert_response :success
  end

  test "should get edit" do
    get edit_rentedCar_url(@rent)
    assert_response :success
  end

  test "should update rent" do
    patch rentedCar_url(@rent), params: {rent: {  } }
    assert_redirected_to rentedCar_url(@rent)
  end

  test "should destroy rent" do
    assert_difference('RentedCar.count', -1) do
      delete rentedCar_url(@rent)
    end

    assert_redirected_to rentedCaredCars_url
  end
end
