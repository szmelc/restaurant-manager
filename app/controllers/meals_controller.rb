class MealsController < ApplicationController
  def index
    @meals = Meal.all
    if !(user_signed_in?) 
      redirect_to new_user_session_path
    end
  end

  def show

  end
end
