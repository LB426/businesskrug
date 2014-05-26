require 'test_helper'

class BiznesstypesControllerTest < ActionController::TestCase
  test "should get get_biznesstype" do
    get :get_biznesstype
    assert_response :success
  end

end
