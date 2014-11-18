class PizzaJointsController < ApplicationController
  def edit
    @pizza_joint = PizzaJoint.find(params[:id])
  end

  def update
    @pizza_joint = PizzaJoint.find(params[:id])
    if @pizza_joint.update(params.require(:pizza_joint).permit(:name, :city))
      redirect_to root_path
    else
      render :edit
    end
  end
end
