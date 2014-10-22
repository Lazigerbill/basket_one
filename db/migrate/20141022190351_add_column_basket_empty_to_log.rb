class AddColumnBasketEmptyToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :basket_empty, :boolean
  	remove_column :logs, :date
  end
end
