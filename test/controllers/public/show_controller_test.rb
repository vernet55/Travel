require "test_helper"

class Public::ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_show_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_show_update_url
    assert_response :success
  end
end
