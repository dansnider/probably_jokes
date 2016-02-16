class AddDefaultValueToUserScore < ActiveRecord::Migration
	def up
	  change_column_default :tweets, :user_score, 0
	end

	def down
	  change_column_default :tweets, :user_score, nil
	end
end
