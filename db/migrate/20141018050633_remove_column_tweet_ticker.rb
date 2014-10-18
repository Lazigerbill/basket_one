class RemoveColumnTweetTicker < ActiveRecord::Migration
  def change
  	remove_column :tweets, :ticker
  	remove_column :tweets, :tweet_id
  	add_column :tweets, :stock_id, :integer
  	add_column :tweets, :tweet_id, :bigint
  end
end
