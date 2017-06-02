class HomeController < ApplicationController
  def index
  end

  def friends
  	@user = User.find_by_username(params[:username])
  	@tweets = @user.followings
  	@username = @user.username
    # render json: @tweets
  end

  def show
  	@user = User.find_by_username(params[:username])
  	@tweets = @user.all_tweets
  	@username = @user.username
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
