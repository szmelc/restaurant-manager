class CommentsController < ApplicationController

	def new 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)

		if @comment.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end


	private

	def comment_params
		params[:comment].permit(:content)
	end
end
