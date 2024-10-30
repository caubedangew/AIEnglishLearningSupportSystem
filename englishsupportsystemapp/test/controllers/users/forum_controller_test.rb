require "test_helper"

class Users::ForumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_forum_index_url
    assert_response :success
  end
end
