class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios, id: false do |t|
      t.belongs_to :user
      t.belongs_to :stock

      t.timestamps
    end
  end
end
