class LogsController < ApplicationController
	def show
		@logs = Log.all(current_user)
	end

	def create
		@user = current_user
		if params[:buy_action] != nil
			stock_symbol, stock_price = params[:buy_action].split(',')
			stock_price = stock_price.to_f
			if !!stock_symbol && !!stock_price
					if @user.logs.last.number_of_shares == 0 || @user.logs.last.number_of_shares == nil
						buy_stock(stock_symbol, stock_price)
					else
						sell_stock
						buy_stock(stock_symbol, stock_price)
					end
			end
		elsif params[:sell_action] != nil
			stock_symbol, stock_price = params[:sell_action].split(',')
			stock_price = stock_price.to_f
			if !!stock_symbol && !!stock_price
					if @user.logs.last.number_of_shares != 0 && Stock.find(@user.logs.last.stock_id).yahoo_symbol == stock_symbol
						sell_stock(stock_symbol, stock_price)
					end
			else
				redirect_to user_path(current_user)
			end	
		end		
	end



	def buy_stock(stock_symbol, stock_price)
		@log = Log.new
		@log.user_id = @user.id
		@log.investor_type = @user.logs.last.investor_type
		@log.points = @user.logs.last.points%stock_price
		@log.stock_id = Stock.find_by_yahoo_symbol(stock_symbol).id
		@log.number_of_shares = @user.logs.last.points/stock_price
		@log.asset_points = @log.number_of_shares * stock_price + @log.points
		@log.transactions = "BUY"
		@log.transaction_price_in_cents = stock_price*100
		@log.save
		redirect_to user_path(current_user), :notice => "You just placed all your eggs in #{stock_symbol}" 
	end

	def sell_stock(stock_symbol, stock_price)
		@log = Log.new
		@log.user_id = @user.id
		@log.investor_type = @user.logs.last.investor_type
		@log.points = @user.logs.last.number_of_shares*stock_price
		@log.stock_id = nil
		@log.number_of_shares = nil
		@log.asset_points = @log.points
		@log.transactions = "SELL"
		@log.transaction_price_in_cents = stock_price*100
		@log.save
		redirect_to user_path(current_user), :notice => "You just sold all your #{stock_symbol}!" 
	end
end


    # t.string   "investor_type"
    # t.integer  "points"
    # t.integer  "stock_id"
    # t.integer  "number_of_shares"
    # t.integer  "asset_points"
    # t.datetime "date"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "transactions"
    # t.integer  "transaction_price_in_cents"
    # t.integer  "user_id"