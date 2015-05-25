class TweetsController < ApplicationController

	def random
		@tweet = Tweet.all.sample

		respond_to do |format|
			format.json { render json: @tweet }
		end

	end

	def self.filter(collection)
  	collection.each do |tweet|
  		if tweet.text.match(/\bpm|ticket|weekend|tonight|tonite|2night|2nite|tomorrow|season|watch|special|episode|show|comedycentral|trailer|album\b/i)
  			tweet.destroy!
  		elsif tweet.text.starts_with?(".", "@")
  			tweet.destroy!
  		elsif tweet.favorite_count.to_i < 30
  			tweet.destroy!
  		elsif tweet.text.length.to_i < 45
  			tweet.destroy!
  		end
  	end
  	return collection
  end

end
