class PinnedPostsController < ApplicationController

	def show
	end

	def new
		@pinned_post = current_user.pinned_posts.build
	end

	def create
		@pinned_post = current_user.pinned_posts.build(pinned_post_params)
		if @pinned_post.save
			redirect_to root_path
		else
			redirect_to new_pinned_post_path
		end
	end

	def destroy
	end

	private

	def pinned_post_params
		params.require(:pinned_post).permit(:content)
	end


end
