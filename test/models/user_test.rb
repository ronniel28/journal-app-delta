require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "test",email: "test@email.com", password: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    user2 = User.new(username: "test",email: "test1@email.com", password: "password")
    assert_not user2.valid?
  end

  test "email should be unique" do
    @user.save
    user2 = User.new(username: "test1",email: "test@email.com", password: "password")
    assert_not user2.valid?
  end
end
