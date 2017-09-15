class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:content))

		if @comment.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
end
