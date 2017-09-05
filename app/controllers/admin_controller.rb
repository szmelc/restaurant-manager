class AdminController < ApplicationController
  def index
  	@users = User.all
    @orders = Order.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy

  	if @user.destroy
  		redirect_to admin_path
  	end
  end



end
