class AddComediansToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :comedian_name, :string
    add_column :tweets, :comedian_screen_name, :string
    add_column :tweets, :comedian_url, :string
    add_column :tweets, :comedian_image_url, :string
  end
end
