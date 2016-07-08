require 'test_helper'

class IncludeControllerTest < ActionController::TestCase
  test "should get header" do
    get :header
    assert_response :success
  end

end
