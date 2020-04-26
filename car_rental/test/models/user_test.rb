require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @user = User.new(user_name: "Sarah", password_digest: "sarah_1",email: "sarah@gmail.com", name: "sarah", address: "Damanhour",  dob: "2020-1-1", age: 23, points:1)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should be present" do
    @user.user_name = " "
    assert_not @user.valid?
  end

  test "user name should not be too short" do
    @user.user_name = "aa"
    assert_not @user.valid?
  end

  test "user name should not be too long" do
    @user.user_name = "a" * 26
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too short" do
    @user.email = "aaaa"
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 51
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too short" do
    @user.name = "aa"
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 26
    assert_not @user.valid?
  end

  test "address should be present" do
    @user.address = " "
    assert_not @user.valid?
  end

  test "address should not be too short" do
    @user.address = "aaaa"
    assert_not @user.valid?
  end


  test "age should be present" do
    @user.age = nil
    assert_not_nil @user.valid?
  end

  test "age should be greater than 17" do
    assert_operator @user.age, :>, 17
  end


  test "points should not be negative" do
    assert_operator @user.points, :>=, 0.0
  end

end
