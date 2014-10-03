class Stocks_user < ActiveRecord::Base
	belongs_to :stocks
	belongs_to :users
end
