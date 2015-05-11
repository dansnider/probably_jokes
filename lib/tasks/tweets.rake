
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

namespace :get do

  desc "Rake task to populate db with new tweets"
  task :new_tweets => [:environment] do

  tweets_to_add = []

    Comedian.all.each do |comedian|
      comic_tweets = client.user_timeline(comedian.screen_name, {exclude_replies: true, include_rts: false})
      comic_tweets.each do |tweet|
        tweets_to_add << Tweet.create({
          comedian_id: comedian.id, 
          text: tweet.text,
          retweet_count: tweet.retweet_count, 
          favorite_count: tweet.favorite_count
          })
      end
      Tweet.filter(tweets_to_add)
    end
    
  end
end


# 







