class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :comedian, index: true
      t.text :text
      t.string :retweet_count
      t.string :favorite_count

      t.timestamps null: false
    end
    add_foreign_key :tweets, :comedians
  end
end
