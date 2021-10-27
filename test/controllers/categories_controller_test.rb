require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    setup do
        @user = users(:john)
        @user.password = "password"
        
      end

    test "should show index" do 
      get categories_path
      assert_response :success
    end

    test "should get new" do
      @category = @user.categories.create(description: "sports")
      get new_category_path
      assert_response :success
    end


end