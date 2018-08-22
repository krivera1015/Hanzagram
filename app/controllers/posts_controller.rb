class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end