# Post Controller
class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all
  end

  def specific_indexing
    # @volunteer = Volunteer.all
    @posts = Post.where('bloodtype =?', current_user.bloodtype)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

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
    params.require(:post).permit(:title, :description, :telephone, :bloodtype, :requester, :user_id, :donator)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
