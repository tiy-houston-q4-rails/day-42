require "test_helper"

class OrderTest < ActiveSupport::TestCase


  def test_full_description
    order = Order.new(bread: "Wheat", meat: "Turkey", pickles: true)
    assert_equal "Turkey on Wheat, with pickles", order.description
  end

end
