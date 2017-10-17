class DishesController < ApplicationController
	load_and_authorize_resource
	respond_to :html, :js
	before_action :creation_params, only: [:show]
	before_action :dish_params, only: [:create, :update]
	before_action :find_dish, only: [:show, :edit, :update, :destroy]
	before_action :categories, only: [:new, :edit]

	def index
		@dishes = Dish.all
		@categories = Dish.distinct.pluck(:category)
	end

	def show
		respond_to do |format|
		  format.js {render layout: false}
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

	def edit
	end

	def update		
		@dish.update(dish_params)
		if @dish.update(dish_params)
			redirect_to dishes_path
		else
			puts 'Something went wrong'
			redirect_to edit_dish_path
		end
	end

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end	



	private

	def creation_params
		params.permit(:dish)
	end	

	def dish_params
		params.require(:dish).permit(:name, :price, :type, :description, :category, :image)
	end

	def find_dish
		@dish = Dish.find(params[:id])
	end

	def categories
		@categories = ['Zupy', 'Dania z wołowiną', 'Dania z kurczakiem', 'Dania z owocami morza', 'Napoje']
	end


end
