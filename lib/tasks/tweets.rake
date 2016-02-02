
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
        new_tweet = Tweet.new({
          comedian_id: comedian.id, 
          comedian_name: tweet.user.name,
          comedian_screen_name: tweet.user.screen_name,
          comedian_url: "https://twitter.com/" + tweet.user.screen_name,
          comedian_image_url: tweet.user.profile_image_url,
          text: tweet.text,
          retweet_count: tweet.retweet_count, 
          favorite_count: tweet.favorite_count
          })
        if tweet.media?
          new_tweet["media"] = tweet.media[0].media_url.to_s
          new_tweet["media_type"] = "image"
        elsif tweet.urls?
          if tweet.urls[0].expanded_url.to_s.starts_with?("https://www.instagram.com")
            new_tweet["media"] = tweet.urls[0].expanded_url.to_s
            new_tweet["media_type"] = "instagram"
          end
        end
        new_tweet.save
        tweets_to_add << new_tweet
      end
      Tweet.filter(tweets_to_add)
    end   
  end
end

 # In the rake task, load tweets to memory, Tweet.all, 
 # and if tweet date is older than a certain point (30 days?)
 # and if the tweet has less than a certain rating, delete tweet.
 # namespace clean tweets
