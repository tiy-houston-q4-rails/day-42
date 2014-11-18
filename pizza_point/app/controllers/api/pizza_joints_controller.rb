class Api::PizzaJointsController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @pizza_joint = PizzaJoint.new(params.require(:pizza_joint).permit(:name, :city))
    save_and_render @pizza_joint
  end

  def update
    @pizza_joint = PizzaJoint.find(params[:id])
    @pizza_joint.update(params.require(:pizza_joint).permit(:name, :city))
    save_and_render @pizza_joint
  end

  def save_and_render(model)
    if model.save
      render json: model
    else
      render json: {errors: model.errors}, status: 422
    end
  end

  # "Responder version"
  # respond_to :json
  #
  # def create
  #   @pizza_joint = PizzaJoint.new(params.require(:pizza_joint).permit(:name, :city))
  #   @pizza_joint.save
  #   respond_with @pizza_joint, location: false
  # end
end
