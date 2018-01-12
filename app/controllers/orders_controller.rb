class OrdersController < ApplicationController

  def index
    user = current_user
    user_id = current_user.id
    @orders_all = OrdersQuery.new.by_user(user)
    @orders_today = OrdersQuery.new(@orders_all).today
  end

  def new
    find_all_meals
    if user_signed_in?
      display_dishes
      @order = current_user.orders.build
    else
      redirect_to root_path
    end
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to orders_path
    else
      render new
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :user_id,
      meals_attributes:
      Meal.attribute_names.map(&:to_s).push(:_destroy)
    )
  end

  def find_all_meals
    @meal = Meal.all
  end

  def display_dishes
    @dishes = Dish.all
  end
end
