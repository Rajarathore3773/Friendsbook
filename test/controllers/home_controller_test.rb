require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get indec" do
    get home_indec_url
    assert_response :success
  end
end
