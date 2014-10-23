class LogsController < ApplicationController

	def create
		@user = current_user
		if params[:buy_action] != nil
			stock_symbol, stock_price = params[:buy_action].split(',')
			stock_price = stock_price.to_f
			if !!stock_symbol && !!stock_price
					if @user.logs.last.basket_empty
						buy_stock(stock_symbol, stock_price)
					else
						transition_out
						buy_stock(stock_symbol, stock_price)
					end
				redirect_to user_logs_path(current_user), :notice => "You just placed all your eggs in #{stock_symbol}"	
			end
		elsif params[:sell_action] != nil
			stock_symbol, stock_price = params[:sell_action].split(',')
			stock_price = stock_price.to_f
			if !!stock_symbol && !!stock_price
					if @user.logs.last.number_of_shares != 0 && @user.logs.last.stock.yahoo_symbol == stock_symbol
						sell_stock(stock_symbol, stock_price)
					end
				redirect_to user_logs_path(current_user), :notice => "You just sold all your #{stock_symbol}!" 	
			end	
		else
			redirect_to user_path(current_user), :notice => "Error occurred!"
		end		
	end



	def buy_stock(stock_symbol, stock_price)
		@log = Log.new
		@log.user_id = @user.id
		@log.investor_type = @user.logs.last.investor_type
		@log.points = (@user.logs.last.points%stock_price.to_f).round
		@log.stock_id = Stock.find_by_yahoo_symbol(stock_symbol).id
		@log.number_of_shares = @user.logs.last.points/stock_price
		@log.asset_points = @log.number_of_shares * stock_price + @log.points
		@log.transactions = "BUY"
		@log.transaction_price = "$" + stock_price.to_s
		@log.basket_empty = false
		@log.save
		 
	end

	def sell_stock(stock_symbol, stock_price)
		@log = Log.new
		@log.user_id = @user.id
		@log.investor_type = @user.logs.last.investor_type
		@log.points = (@user.logs.last.number_of_shares*stock_price.to_f).round + @user.logs.last.points
		@log.stock_id = Stock.find_by_yahoo_symbol(stock_symbol).id
		@log.number_of_shares = @user.logs.last.number_of_shares
		@log.asset_points = @log.points
		@log.transactions = "SELL"
		@log.transaction_price = "$" + stock_price.to_s
		@log.basket_empty = true
		@log.save
		
	end

	def transition_out
		transition_stock = @user.logs.last.stock.yahoo_symbol
		exit_price = Stock.pricelookup(transition_stock)
		sell_stock(transition_stock, exit_price)
	end

	def index
		@user = current_user
		@logs = @user.logs
	end
end

