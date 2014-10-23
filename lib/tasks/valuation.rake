namespace :log do
	desc "RUN DAILY MON-FRI CREATE LOG FOR END OF DAY VALUATION"
	task daily_valuation: :environment do
		@user = User.all
		@user.each do |user|
			if user.logs.last.basket_empty
				@log = Log.new
				@log.user_id = user.id
			# check investor type
			@log.investor_type = user.logs.last.investor_type
			@log.points = user.logs.last.points
			@log.stock_id = nil
			@log.number_of_shares = nil
			@log.asset_points = user.logs.last.asset_points
			@log.transactions = "VALUATION"
			@log.transaction_price = nil
			@log.basket_empty = true
			@log.save
		else
			current_holding = user.logs.last.stock.yahoo_symbol
			stock_price = user.logs.last.stock.last_trade_price
			@log = Log.new
			@log.user_id = user.id
			# check investor type
			@log.investor_type = user.logs.last.investor_type
			@log.points = user.logs.last.points
			@log.stock_id = user.logs.last.stock_id
			@log.number_of_shares = user.logs.last.number_of_shares
			@log.asset_points = @log.number_of_shares * stock_price + @log.points
			@log.transactions = "VAL"
			@log.transaction_price = "$" + stock_price.to_s
			@log.basket_empty = false
			@log.save
		end
	end

end
end