class MainController < ApplicationController
	def index
	end


	def search
		render json: {users: [], meals: []}
	end
end