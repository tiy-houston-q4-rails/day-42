require 'test_helper'
require 'pry'

class PizzaJointTest < ActiveSupport::TestCase

  def setup
    # do something
    @pizza_joint = PizzaJoint.create name: "yolo", city: "Houston, TX"
  end

  def test_geocodes_into_lat
    # assert that what you expected, is what you got
    assert @pizza_joint.lat, "Lat should have been set"
  end

  def test_geocodes_into_lng
    # assert that what you expected, is what you got
    assert @pizza_joint.lng, "Lng should have been set"
  end

  def test_handle_bad_city_input
    pizza_joint = PizzaJoint.new city: "32897234hnslfsa;dofi"
    pizza_joint.valid?
    assert pizza_joint.errors[:lat].present?, "Has at least 1 error on lat. cuz required"
    assert pizza_joint.errors[:lng].present?, "Has at least 1 error on lng. cuz required"
  end

  def test_city_is_required
    pizza_joint = PizzaJoint.new
    pizza_joint.valid?
    assert pizza_joint.errors[:city].present?, "Has at least 1 error on city. cuz required"
  end



end
