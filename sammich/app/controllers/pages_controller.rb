class PagesController < ApplicationController
  def index
    redirect_to new_order_path
  end
end
