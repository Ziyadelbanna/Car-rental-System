require 'test_helper'

class SavedCarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @saved_car = SavedCar.new(user_id: 3, savedcar_id: 3)
    @user = User.new(user_name: "Sarah", password_digest: "sarah_1",email: "sarah@gmail.com", name: "sarah", address: "Damanhour",  dob: "2020-1-1", age: 23, points:1)
    @car = cars(:one)
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
