class AddColumnToStock < ActiveRecord::Migration
  def change
  	add_column :stocks, :exchange, :string
  end
end
