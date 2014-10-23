class AddColumnToStockLastClosePrice < ActiveRecord::Migration
  def change
  	add_column :stocks, :last_trade_price, :decimal, :precision => 8, :scale => 2
  end
end
