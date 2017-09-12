class DishesController < ApplicationController
	respond_to :html, :js

	def index
		@dishes = Dish.all
		@categories = Dish.distinct.pluck(:category)
	end

	def show
		@dish = Dish.find(params[:id])

		respond_to do |format|
		  format.js {render layout: false} # Add this line to you respond_to block
		end		
	end

	def new
		@dish = Dish.new
	end

	def create
		@dish = Dish.create(dish_params)
		if @dish.save
			puts 'Dish saved!'
		else
			puts 'Something went wrong'
		end
		redirect_to dishes_path
	end



	private

	def dish_params
		params.require(:dish).permit(:name, :price, :type, :description, :category)
	end

end
