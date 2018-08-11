require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get free" do
    get home_free_url
    assert_response :success
  end

end
