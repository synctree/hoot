class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def follow
    user_to_follow = User.find_by_username(params[:username])
    current_user.follows.find_or_create_by_following_user_id(user_to_follow)
    redirect_to :back
  end

  def unfollow
    user_to_follow = User.find_by_username(params[:username])
    current_user.follows.find_by_following_user_id(user_to_follow).try(:destroy)
    redirect_to :back
  end

  def followings
    @followings = current_user.followings
  end

  def followers
    @followers = current_user.followers
  end

end
