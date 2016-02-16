class TweetsController < ApplicationController

	def random
		tweet = Tweet.all.sample

		respond_to do |format|
			format.json { render json: tweet }
		end
	end

	def vote
		tweet = Tweet.find(params["id"])
		tweet.user_score += 1
		tweet.save!

		render json: nil, status: :ok
	end

	def top_ten
		binding.pry
		tweets = []
		tweets << Tweet.all
		tweets = tweets.first(10)

		respond_to do |format|
			format.json { render json: tweets }
		end
	end

end
