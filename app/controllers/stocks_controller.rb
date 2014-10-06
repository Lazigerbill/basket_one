class StocksController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update, :destroy]
	def new
		@stock = Stock.new
	end

	def create
		@user = current_user
		@stock = @user.stocks.find_or_create_by(stock_params)
		redirect_to user_path(current_user)
	end

	def destroy
		@user = current_user
	  	@stock = @user.stocks.destroy(stock_params[:id])
	  	respond_to do |format|
	    	format.html { redirect_to user_url(@user), notice:  'Your favorite list is updated.' }
	    	format.json { head :no_content }
	  end
	end

	private
	def stock_params
		params.permit(:yahoo_symbol, :twitter_symbol, :company_name, :search, :id)

	end

end
