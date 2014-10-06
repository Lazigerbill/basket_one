class StocksController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update, :destroy]
	def new
		@user = current_user
		@stock = @user.stocks.build
	end

	def create
		stock_symbol, stock_name = params[:stock_lookup].split(',')

		@user = current_user
		@stock = Stock.find_by_yahoo_symbol(stock_symbol)
		if @stock.nil?
			@stock = Stock.new
			@stock.yahoo_symbol = stock_symbol
			@stock.twitter_symbol = "$" + stock_symbol.to_s
			@stock.company_name = stock_name
			@stock.save
		end
		@user.stocks << @stock
		@user.save

		redirect_to user_path(current_user)
	end

	def destroy
 		current_user.stocks.destroy(params[:id])
	  	respond_to do |format|
	    	format.html { redirect_to user_url(current_user), notice:  'Your favorite list is updated.' }
	    	format.json { head :no_content }
	  end
	end

	private
	def stock_params
		params.require(:stock).permit(:yahoo_symbol, :twitter_symbol, :company_name, :search, :id)
	end

end
