require "test_helper"

class RootPageTest < Capybara::Rails::TestCase
  test "home page should redirect to new order" do
    visit "/"

    assert_equal new_order_path, current_path

  end
end
