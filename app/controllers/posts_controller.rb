class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to root_path
    flash[:success] = "Great! You created a new post."
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
