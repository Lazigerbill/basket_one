class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :yahoo_symbol
      t.string :twitter_symbol
      t.string :company_name

      t.timestamps
    end
  end
end
