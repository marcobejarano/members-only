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
    if @post.errors.any?
      flash.now[:error] = "Ups! Fix up the mistake, please."
      render :new, status: :unprocessable_entity
    else
      redirect_to @user
      flash[:success] = "Great! You created a new post."
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
