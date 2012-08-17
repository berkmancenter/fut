require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get learn_more" do
    get :learn_more
    assert_response :success
  end

end
