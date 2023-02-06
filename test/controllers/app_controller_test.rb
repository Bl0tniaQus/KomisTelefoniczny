require "test_helper"

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_index_url
    assert_response :success
  end

  test "should get register" do
    get app_register_url
    assert_response :success
  end

  test "should get login" do
    get app_login_url
    assert_response :success
  end

  test "should get add" do
    get app_add_url
    assert_response :success
  end
end
