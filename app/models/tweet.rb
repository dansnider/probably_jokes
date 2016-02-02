class Tweet < ActiveRecord::Base
  belongs_to :comedian

  def self.filter(collection)
  	collection.each do |tweet|
  		if tweet.text.match(
        /\b
        pm|
        ticket|
        weekend|
        tonight|
        tonite|
        2night|
        2nite|
        tomorrow|
        season|
        watch|
        special|
        event|
        donation|
        episode|
        show|
        comedycentral|
        trailer|
        issue|
        article|
        album|
        director|
        netflix|
        pre-order|
        book|
        follow|
        snapchat|
        live|
        series|
        pilot|
        season|
        congrats|
        congratulations|
        \b/ix
        )
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
