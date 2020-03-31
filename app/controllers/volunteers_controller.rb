class VolunteersController < ApplicationController
  before_action(only: %i[destroy]) { @volunteer = Volunteer.find(params[:id]) }
  before_action :find_post, only: %i[create destroy]

  def create
    @volunteer = @post.volunteers.create(volunteer_params)
    @volunteer.user = current_user

    if @volunteer.save
      flash[:notice] = 'Your volunteer application has been accepted'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'No response from the server, please try again!'
    end
  end

  def destroy; end

  private

  def find_post
    @post = Post.find_by_id(params[:post_id])
  end

  def volunteer_params
    params.permit(:post_id, :user_id)
  end
end
