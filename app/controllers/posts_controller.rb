class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "That is a nice looking picture!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post was not processed!"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
