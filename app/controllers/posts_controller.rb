class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorized, except: [:index, :new, :create]


  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "That is a nice looking picture!"
      redirect_to profile_path(current_user.username)
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
    if @post.update(post_params)
      flash[:success] = "Post Updated"
    redirect_to post_path(@post)
    else
      flash[:alert] = "Update failed. Please check the form."
      render :edit
    end
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

  def authorized
    redirect_to login_path unless session[:user_id]
  end

end
