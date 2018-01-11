class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comments = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params.require(:comment).permit(:content))
    @comment.user_id = current_user.id if current_user
    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require[:comment].permit(:content)
  end
end
