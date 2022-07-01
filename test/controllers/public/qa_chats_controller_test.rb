require "test_helper"

class Public::QaChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_qa_chats_show_url
    assert_response :success
  end
end
