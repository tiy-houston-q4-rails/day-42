class PagesController < ApplicationController
  def home
    @pizza_joints = PizzaJoint.all
  end
end
