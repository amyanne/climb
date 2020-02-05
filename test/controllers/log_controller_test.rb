require 'test_helper'

class LogControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get log_new_url
    assert_response :success
  end

  test "should get show" do
    get log_show_url
    assert_response :success
  end

end
