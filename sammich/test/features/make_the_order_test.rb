require "test_helper"

class MakeTheOrderTest < Capybara::Rails::TestCase

  test "make the order" do

    order = Order.create bread: "Wheat", meat: "None"

    visit orders_path
    click_button "Make This Order"

    order.reload
    assert true, order.made?
  end

  test "made orders do not show" do

    order = Order.create bread: "Wheat", meat: "None"
    made_order = Order.create bread: "Ciabatta", meat: "All", made: true

    visit orders_path
    # Ciabatta should not show on that page
    refute_content page, "Ciabatta"
    assert_content page, "Wheat"
  end
end
