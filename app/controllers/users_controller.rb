class UsersController < ApplicationController
  def update_donated_date_post_donator
    @post = Post.find(params[:id])
    @post.update(params.permit(:donator))

    @user = User.find(params[:user_id])
    @user.update(params.permit(:last_donated_date))

    redirect_back(fallback_location: root_path)
  end
end
