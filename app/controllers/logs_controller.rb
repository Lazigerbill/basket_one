class LogsController < ApplicationController
	def show
		@logs = Log.all(current_user)
	end

	def buy
		@user = current_user
		stock_symbol, stock_price = params[:buy_action].split(',')
		stock_price = stock_price.to_f
		if !!stock_symbol && !!stock_price
				if @user.logs.last.number_of_shares == 0 || @user.logs.last.number_of_shares == nil
					buy_stock(stock_symbol, stock_price)
				else
					sell_stock
					buy_stock(stock_symbol, stock_price)
				end
		else
			render root_path
		end
	
				# @log = Log.new
				# @log.user_id = @user.id
				# 
				# @log.number_of_shares = @logs.last.points/stock_price.to_i
				# @log.points = @log.points%stock_price.to_i
				# @log.transaction_price_in_cents = stock_price.to_i*100
				# 
				# redirect_to user_path(current_user), :notice => "#{@stock.company_name} is added to portfolio." 
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