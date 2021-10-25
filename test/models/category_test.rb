require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:john)
    @user.password = "password"
    @category = Category.new(description: "sports", user: @user)
   
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "description should be present" do
    @category.description= ""
    assert_not @category.valid?
  end

  test "category should not be too long" do
    @category.description = "a" * 35
    assert_not @category.valid?
  end

  test "category should not bee too short" do
    @category.description = "a" 
    assert_not @category.valid?
  end


end
