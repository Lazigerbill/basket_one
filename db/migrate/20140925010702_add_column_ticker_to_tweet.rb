class AddColumnTickerToTweet < ActiveRecord::Migration
  def change
  	add_column :tweets, :ticker, :string
  end
end
