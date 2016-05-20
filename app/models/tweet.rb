class Tweet < ActiveRecord::Base
  belongs_to :comedian

  def self.filter(collection)
  	collection.each do |tweet|
  		if tweet.text.match(/\bpm|ticket|weekend|tonight|tonite|2night|2nite|tomorrow|season|watch|special|event|donation|episode|show|comedycentral|trailer|issue|article|album|director|netflix|pre-order|book|follow|snapchat|live|series|pilot|season|congrats|congratulations|theaters|donate|proud|relief|taping\b/i)
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

  def self.linkify_links(text)
    split_text = text.split(' ')
    split_text.each do |word|
      if word.starts_with?("https://t.co")
        word.gsub!(word, '<a class="link" target="_blank" href="' + word + '">' + word + '</a>')
      elsif word.starts_with?("#")
        word.gsub!("#", "")
        word.gsub!(word, '<a class="hashtag-link" target="_blank" href="https://twitter.com/hashtag/' + word + '">#' + word + '</a>')
      elsif word.starts_with?("@")
        word.gsub!("@", "")
        word.gsub!(word, '<a class="user-link" target="_blank" href="https://twitter.com/' + word + '">@' + word + '</a>')
      end
    end
    return split_text.join(" ")
  end

end
