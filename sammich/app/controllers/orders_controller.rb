class OrdersController < ApplicationController

  def index
    @orders = Order.where(made: false)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params.require(:order).permit(:meat, :bread, :pickles))
    if @order.save
      redirect_to new_order_path
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(params.require(:order).permit(:made))
      redirect_to orders_path
    else
      render :edit
    end
  end
end
