require 'test_helper'

class SavedCarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_car = saved_cars(:one)
  end

  test "should get index" do
    get saved_cars_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_car_url
    assert_response :success
  end

  test "should create saved_car" do
    assert_difference('SavedCar.count') do
      post saved_cars_url, params: { saved_car: {  } }
    end

    assert_redirected_to saved_car_url(SavedCar.last)
  end

  test "should show saved_car" do
    get saved_car_url(@saved_car)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_car_url(@saved_car)
    assert_response :success
  end

  test "should update saved_car" do
    patch saved_car_url(@saved_car), params: { saved_car: {  } }
    assert_redirected_to saved_car_url(@saved_car)
  end

  test "should destroy saved_car" do
    assert_difference('SavedCar.count', -1) do
      delete saved_car_url(@saved_car)
    end

    assert_redirected_to saved_cars_url
  end
end
