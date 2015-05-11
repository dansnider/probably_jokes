class CreateComedians < ActiveRecord::Migration
  def change
    create_table :comedians do |t|
      t.string :id_str
      t.string :name
      t.string :screen_name
      t.string :url
      t.string :profile_image_url
      t.string :followers_count

      t.timestamps null: false
    end
  end
end
