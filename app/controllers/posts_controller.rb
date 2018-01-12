class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_post, only: [:show, :destroy]

  def index
    @post = current_user.posts.build
    @posts = Post.order('created_at DESC').all
    @pinned_post = PinnedPost.last
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update

  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
