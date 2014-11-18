require "test_helper"

class PizzaJointsControllerTest < ActionController::TestCase
  def test_edit
    get :edit
    assert_response :success
  end

end
