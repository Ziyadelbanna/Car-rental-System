# require 'test_helper'
#
# class RentedCarsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @rented_car = rented_cars(:one)
#   end
#
#   test "should get index" do
#     get rented_cars_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_rented_car_url
#     assert_response :success
#   end
#
#   test "should create rented_car" do
#     assert_difference('RentedCar.count') do
#       post rented_cars_url, params: { rented_car: {  } }
#     end
#
#     assert_redirected_to rented_car_url(RentedCar.last)
#   end
#
#   test "should show rented_car" do
#     get rented_car_url(@rented_car)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_rented_car_url(@rented_car)
#     assert_response :success
#   end
#
#   test "should update rented_car" do
#     patch rented_car_url(@rented_car), params: { rented_car: {  } }
#     assert_redirected_to rented_car_url(@rented_car)
#   end
#
#   test "should destroy rented_car" do
#     assert_difference('RentedCar.count', -1) do
#       delete rented_car_url(@rented_car)
#     end
#
#     assert_redirected_to rented_cars_url
#   end
# end
