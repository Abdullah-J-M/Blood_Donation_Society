class VolunteersController < ApplicationController
  before_action :set_volunteer, only: %i[destroy]
  before_action :find_post, only: %i[create destroy]

  def create
    @volunteer = @post.volunteers.create(volunteer_params)
    @volunteer.user = current_user

    if @volunteer.save
      flash[:notice] = 'You have successfully applied'
      redirect_to posts_specific_indexing_path
    else
      flash.now[:alert] = 'Could not apply, try again'
    end
  end

  def destroy; end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.permit(:post_id, :user_id)
  end
end
