class ChangeColumnLogTransactionPriceinCents < ActiveRecord::Migration
  def change
  	remove_column :logs, :transaction_price_in_cents
  	add_column :logs, :transaction_price, :float
  end
end
