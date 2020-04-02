class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :find_post, only: %i[create destroy]

  def create
    # Changing create to new
    @comment = @post.comments.create(comment_params)
    # adding new changes to hopefully make this works
    @comment.user = current_user
    # Add name of the user here
    @comment.name = current_user.name

    if @comment.save
      flash[:notice] = 'Comment was posted successfully'
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    flash[:notice] = 'Comment was deleted successfully'
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:post_id, :comment, :user_id, :name)
  end
end
