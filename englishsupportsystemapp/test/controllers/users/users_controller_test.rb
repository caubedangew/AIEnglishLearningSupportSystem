require "test_helper"

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get users_users_login_url
    assert_response :success
  end

  test "should get register" do
    get users_users_register_url
    assert_response :success
  end
end
