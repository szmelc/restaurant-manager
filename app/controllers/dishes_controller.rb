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

end
