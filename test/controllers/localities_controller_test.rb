require 'test_helper'

class LocalitiesControllerTest < ActionController::TestCase
  test "should get get_locality" do
    get :get_locality
    assert_response :success
  end

end
