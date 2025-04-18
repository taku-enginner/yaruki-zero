require "test_helper"

class MotivationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get motivations_new_url
    assert_response :success
  end

  test "should get create" do
    get motivations_create_url
    assert_response :success
  end
end
