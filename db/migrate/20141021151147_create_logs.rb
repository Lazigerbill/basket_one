class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :investor_type
      t.integer :points
      t.integer :stock_id
      t.integer :number_of_shares
      t.integer :asset_points
      t.datetime :date

      t.timestamps
    end
  end
end
