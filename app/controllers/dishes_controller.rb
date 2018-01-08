class DishesController < ApplicationController
  # load_and_authorize_resource
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
    authorize! :create, @dish
    @dish = Dish.new
    @categories = ['Zupy', 'Dania z wołowiną', 'Dania z kurczakiem', 'Dania z owocami morza', 'Napoje']
  end

  def create
    @dish = Dish.create(dish_params)
    if @dish.save
      redirect_to dishes_path
    else
      redirect_to new_dish_path
      print_errors(@dish)
    end
  end

  def edit
  end

  def update
    @dish.update(dish_params)
    if @dish.update(dish_params)
      redirect_to dishes_path
    else
      redirect_to edit_dish_path
    end
  end

  def destroy
    @dish.destroy
    authorize! :destroy, @dish
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

  def print_errors(object)
    object.errors.full_messages.each do |message|
      flash[:notice] = message
    end
  end

end
