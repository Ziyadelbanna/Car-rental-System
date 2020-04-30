# require 'test_helper'
#
# class ReviewsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     #@review = reviews(:one)
#     @review = Review.create(id: 3,user_id: 3, car_id: 3, rank: 1, content: "MyText")
#
#   end
#
#   test "should get index" do
#     get car_reviews_url
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_car_review_url
#     assert_response :success
#   end
#
#   test "should create review" do
#     assert_difference('Review.count') do
#       post car_reviews_url, params: { review: { car_id: @review.car_id, content: @review.content, rank: @review.rank, user_id: @review.user_id } }
#     end
#
#     assert_redirected_to car_review_url(Review.last)
#   end
#
#   test "should show review" do
#     get car_review_url(@review)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_car_review_url(@review)
#     assert_response :success
#   end
#
#   test "should update review" do
#     patch car_review_url(@review), params: { review: { car_id: @review.car_id, content: @review.content, rank: @review.rank, user_id: @review.user_id } }
#     assert_redirected_to car_review_url(@review)
#   end
#
#   test "should destroy review" do
#     assert_difference('Review.count', -1) do
#       delete car_review_url(@review)
#     end
#
#     assert_redirected_to car_reviews_url
#   end
# end
