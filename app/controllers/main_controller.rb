class MainController < ApplicationController
	def index
	end


	def search
		@users = User.ransack(name_cont: params[:q]).result(distinct: true)
		@dishes = Dish.ransack(name_cont: params[:q]).result(distinct: true)

		respond_to do |format|
			format.html {}
			format.json {
				@users = @users.limit(5)
				@dishes = @dishes.limit(5)
			}
		end
	end



	private

end