class OrdersController < ApplicationController
  def index
    user_id = current_user.id
    @orders = Order.all
    @order = @orders.where(:user_id => user_id)
  end

  def new
  end

  def create
  end
end
