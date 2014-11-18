require "test_helper"

class TakeTheOrderTest < Capybara::Rails::TestCase

  test "fill out the form" do

    visit new_order_path
    select "Ciabatta", from: "Bread"
    select "Pastrami", from: "Meat"
    check "Pickles"

    click_button "Place Order"

    # intent make sure order was created
    order = Order.first
    assert_equal "Ciabatta", order.bread
    assert_equal "Pastrami", order.meat
    assert_equal true, order.pickles?
    assert_equal false, order.made?

  end
end
