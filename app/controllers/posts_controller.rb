# Post Controller
class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post was successfully created'
      redirect_to @post
    else
      flash[:alert] = 'Post was not created'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:alert] = 'Post was not updated'
      render 'edit'
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :telephone, :bloodtype, :requester)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
