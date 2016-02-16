class AddUserScoreToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_score, :integer, :default => 1
  end
end
