class ChangeColumnTypeTransactionPrice < ActiveRecord::Migration
  def change
  	remove_column :logs, :transaction_price
  	add_column :logs, :transaction_price, :string
  end
end
