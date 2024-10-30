require "test_helper"

class Users::OnlineChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_online_chat_index_url
    assert_response :success
  end
end
