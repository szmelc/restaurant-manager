class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@users = User.all.order('id ASC')
		@user = User.find(params[:id])
	end

  def update
    @user = current_user
    if @user.update
    	redirect_to @user
    else
    	redirect_to root_path
    end
	end
end
