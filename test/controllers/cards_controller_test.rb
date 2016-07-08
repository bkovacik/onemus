require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  test "should get cards" do
    get :cards
    assert_response :success
  end

end
