class AddTweetUrlToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_url, :string
  end
end
