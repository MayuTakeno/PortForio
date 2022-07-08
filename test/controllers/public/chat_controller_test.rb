require "test_helper"

class Public::ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_chat_index_url
    assert_response :success
  end

  test "should get show" do
    get public_chat_show_url
    assert_response :success
  end
end
