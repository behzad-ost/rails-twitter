class HomeController < ApplicationController
  def index
  end

  def friends
  	@friends = current_user.followings
  	@username = current_user.username
    # render json: @friends
  end

  def show
    @user = User.find_by_username(params[:username])
    @tweets = @user.all_tweets
    @username = @user.username
    # render json: @tweets

  end

  def toggle_follow
  	@user = User.find_by_username(params[:username])
  	if current_user.is_following(@user)
  		flash[:notice] = "You unfollowed @#{@user.username}"
  		current_user.unfollow(@user)
  	else
  		flash[:notice] = "You are following @#{@user.username}"
  		current_user.follow(@user)
  		
  	end
  	redirect_to user_page_path
  end
end
