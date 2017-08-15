class OrdersController < ApplicationController

  def index
    user_id = current_user.id
    @userOrders = Order.where(:user_id => user_id)
  end

  def new
  end

  def create
  end


  private


end
