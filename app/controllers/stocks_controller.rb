class StocksController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def new
		@stock = Stock.new
	end


	def create
		@user = current_user
		@stock = @user.stocks.create(stock_params)
	end


	private
	def stock_params
		params.require(:stock).permit(:yahoo_symbol, :twitter_symbol, :user_id, :company_name, :search)

	end



end
