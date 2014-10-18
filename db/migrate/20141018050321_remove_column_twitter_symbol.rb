class RemoveColumnTwitterSymbol < ActiveRecord::Migration
  def change
  	remove_column :stocks, :twitter_symbol
  end
end
