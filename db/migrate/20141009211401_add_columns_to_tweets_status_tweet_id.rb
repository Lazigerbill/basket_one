class AddColumnsToTweetsStatusTweetId < ActiveRecord::Migration
  def change
  	add_column :tweets, :tweet_id, :string
  	add_column :tweets, :status_id, :string
  end
end
