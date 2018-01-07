class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :destroy]
  def index
    @users = User.all
  end

  def show
    user = User.find(params[:id])
    @user = UserDecorator.new(user)
    @users = User.all.order('id ASC')
    @orders_today = OrdersQuery.new.today
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
      flash[:notice] = 'User was not created.'
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
  end

  def destroy
    @user.destroy

    if @user.destroy
      redirect_to admin_path
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :city,
      :phonenumber,
      :admin,
      :password,
      :password_confirmation
    )
  end
end
