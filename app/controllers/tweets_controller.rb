class TweetsController < ApplicationController

	def random
		@tweet = Tweet.all.sample

		respond_to do |format|
			format.json { render json: @tweet }
		end
	end
end
