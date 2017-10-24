class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@users = User.all.order('id ASC')
		@user = User.find(params[:id])
		user_id = @user.id 
		@user_orders = Order.where(:user_id => user_id)
    @user_orders_today = Order.where(user_id: @user.id).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)  
	end

  def new
    @user = User.new
  end  

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to admin_path
    else
      redirect_to new_user_path
    end
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


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :phonenumber, :admin, :password, :password_confirmation)
  end
end
