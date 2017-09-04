class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@users = User.all.order('id ASC')
		@user = User.find(params[:id])
		user_id = current_user.id # tutaj nie jest DRY; zrefaktoruj to
		@user_orders = Order.where(:user_id => user_id)  
	end

  def update
    @user = current_user
    if @user.update
    	redirect_to @user
    else
    	redirect_to root_path
    end
	end

	def edit
		@user = User.find(params[:id])
	end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy

  	if @user.destroy
  		redirect_to admin_path
  	end
  end
end
