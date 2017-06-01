class TweetsController < ApplicationController
	def create
		tweet = current_user.tweets.build(tweet_params)
		tweet.save!
			redirect_to root_path
	end

	def destroy
		
	end
	private
	  def tweet_params
	    params.require(:tweet).permit(:message)
	  end
end
