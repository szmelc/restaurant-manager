class AdminController < ApplicationController

  def index
  	@users = User.all
    @orders = Order.all
    @orders_today = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    # @orders_today_by_user = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day && :user_id == user.id)
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy

  	if @user.destroy
  		redirect_to admin_path
  	end
  end



end
