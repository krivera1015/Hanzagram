class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You made a comment on this post and that is a fact"
      redirect_to :back
    else
      flash[:alert] = "Please check your comment, something is not right"
      render root_path
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
