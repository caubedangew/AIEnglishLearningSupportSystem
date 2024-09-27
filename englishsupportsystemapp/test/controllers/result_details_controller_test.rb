require "test_helper"

class ResultDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get result_details_edit_url
    assert_response :success
  end

  test "should get update" do
    get result_details_update_url
    assert_response :success
  end
end
