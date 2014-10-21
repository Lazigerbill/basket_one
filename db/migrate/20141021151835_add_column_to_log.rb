class AddColumnToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :transactions, :string
  	add_column :logs, :transaction_price_in_cents, :integer
 	add_column :logs, :user_id, :integer
  end
end
