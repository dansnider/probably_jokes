class AddLinkifiedTextToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :linkified_text, :string
  end
end
