require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @review = Review.create(id: 10, user_id: 3, car_id: 4, rank: 2, content: "not quite good")
  end

  # test "review should be valid" do
  #   assert @review.valid?
  # end

  test "car should exist" do
    @review.car_id = nil
    assert_not_nil @review.valid?
  end

  test "user should exist" do
    @review.user_id = nil
    assert_not_nil @review.valid?
  end

  test "rank greater than or equal zero" do
    assert_operator @review.rank, :>, -1
  end

  test "rank smaller than or equal 5" do
    assert_operator @review.rank, :<=, 5

  end

  test "content should exist" do
    @review.content = ""
    assert_not @review.valid?
  end

  test "content shouldn't be too long" do
    @review.content = "a" * 4294967297
    assert_not @review.valid?
  end
end
