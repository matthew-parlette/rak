require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "redirect when not logged in" do
    get :index
    assert_response :redirect
  end
  
  test "login user" do
    sign_in User.first
    get :index
    assert_response :success
  end
  
  test "logout user" do
    sign_out User.first
    get :index
    assert_response :redirect
  end

end
