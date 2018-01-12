class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :class => AdminController

  def index
    user = current_user
    @user = UserDecorator.new(user)
  	@users = User.all
    @orders_today = OrdersQuery.new.today
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      redirect_to admin_path
    end
  end
end
