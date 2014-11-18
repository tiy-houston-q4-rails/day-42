require 'test_helper'

class Api::PizzaJointsControllerTest < ActionController::TestCase


  # do something
  # assert it was done

  def test_post_and_should_create

    count_before = PizzaJoint.count
    post :create, {pizza_joint: {name: "Harry's", city: "Houston, TX"}, format: 'json'}

    number_created = PizzaJoint.count - count_before
    assert_equal 1, number_created

  end

  def test_should_give_errors_if_invalid
    post :create, {pizza_joint: {name: "Harry's", location: "Houston, TX"}}
    response_json = JSON.parse response.body
    assert_equal 422, response.status
    assert response_json["errors"].present?, "Should have had an error"
  end

  def test_should_update_location
    existing_pizza = PizzaJoint.create name: "YOLO", city: "Pearland, TX"
    put :update, { id: existing_pizza.id, pizza_joint: {name: "Dominos" }}
    existing_pizza.reload
    assert_equal "Dominos", existing_pizza.name
  end

  def test_should_give_errors_if_invalid_on_update
    existing_pizza = PizzaJoint.create name: "YOLO", city: "Pearland, TX"
    put :update, {id: existing_pizza.id, pizza_joint: {city: ""}}

    response_json = JSON.parse response.body
    assert_equal 422, response.status
    assert response_json["errors"].present?, "Should have had an error"
  end

end
