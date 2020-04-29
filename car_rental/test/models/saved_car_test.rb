require 'test_helper'

class SavedCarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @saved_car = SavedCar.new(user_id: 3, savedcar_id: 3)

  end

  test "favourite should not be valid" do
    assert_not @saved_car.valid?
  end

  test "user should be present" do
    @saved_car.user_id = nil
    assert_not_nil @saved_car.valid?
  end


  test "car should be present" do
    @saved_car.savedcar_id = nil
    assert_not_nil @saved_car.valid?
  end

end
