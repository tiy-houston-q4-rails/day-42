require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase

  test "sanity" do

    PizzaJoint.create name: "Coffee n Pizza", city: "Houston, TX"
    visit root_path
    assert_content page, "Coffee n Pizza"
  end

end
