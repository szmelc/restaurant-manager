class OrdersController < ApplicationController
  before_action :find_order, only: [:show]
  before_action :find_meal, only: [:new]

  def orders_all
    @user = current_user
    user_id = current_user.id
    @user_orders = Order.where(:user_id => user_id)
  end

  def orders_today 
    @user = current_user
    user_id = current_user.id
    @user_orders = Order.where(:user_id => user_id)
  end

  def show
  end

  def new
    @dishes = Dish.all
    @order = current_user.orders.build
  end

  def create
    # binding.pry
    # puts order_params
    @order = current_user.orders.build(order_params)
    if @order.save
      puts "Order saved!"
    else
      puts "Something went wrong"
    end
    redirect_to orders_path
  end


  private
  def order_params
    params.require(:order).permit(:user_id, meals_attributes: Meal.attribute_names.map(&:to_s).push(:_destroy))
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def find_meal
    @meal = Meal.all
  end

end
