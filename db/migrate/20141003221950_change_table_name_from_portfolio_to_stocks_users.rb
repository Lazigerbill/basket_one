class ChangeTableNameFromPortfolioToStocksUsers < ActiveRecord::Migration
  def change
  	rename_table :portfolios, :stocks_users
  end
end
