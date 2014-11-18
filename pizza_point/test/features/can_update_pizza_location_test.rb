require "test_helper"

class CanUpdatePizzaLocationTest < Capybara::Rails::TestCase

  test "updating the location" do
    pizza_joint = PizzaJoint.create name: "Katz", city: "Katy, TX"
    # visit homepage
    visit(root_path)

    # click on a pizza location
    click_link "Katz"

    # fill text Boston, MA for location
    fill_in "City", with: "Boston, MA"

    # press submit
    click_button "Update Pizza joint"

    # verify pizza location has been changed
    pizza_joint.reload
    assert_equal "Boston, MA", pizza_joint.city
  end
end
