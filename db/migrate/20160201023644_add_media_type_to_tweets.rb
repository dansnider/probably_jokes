class AddMediaTypeToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :media_type, :string
  end
end
