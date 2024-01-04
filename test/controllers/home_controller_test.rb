require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "Deberia obtener Home" do
    get root_url
    assert_response :success
  end
end
