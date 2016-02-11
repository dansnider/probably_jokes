class TweetsController < ApplicationController

	def random
		@tweet = Tweet.all.sample

		respond_to do |format|
			format.json { render json: @tweet }
		end
	end

	def vote
		vote = params["vote"]
		@tweet = Tweet.find(vote["id"])
		direction = vote["direction"]
		user_score = @tweet.user_score.to_i

		if direction == "up"
			@tweet.user_score = user_score + 1
			@tweet.save!
		elsif direction == "down"
			@tweet.user_score = user_score - 1
			@tweet.save!
		end

		render json: nil, status: :ok
	end

end
