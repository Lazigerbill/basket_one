class IndexController < ApplicationController
	def index
		@user = current_user
		@stocks = []
		@user.stocks.all.each do |stock|
			@stocks << stock.yahoo_symbol
			@stocks.sort!
		end

		if params[:ticker].present?
			@stock = Stock.find_by_yahoo_symbol(params[:ticker]).yahoo_symbol
		elsif @stocks.size > 0
			@stock = @stocks[0]
		else
			@stock = Stock.first.yahoo_symbol
		end
		
		@twitter_ticker = "$" + @stock

		# Tweet.download_tweets(Tweet.get_authorized, @twitter_ticker)
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(@stock, 7)
		@tweet_array = Tweet.tweet_count_array(@stock)

		# Tweet web intents
		@tweet_url = "https://twitter.com/intent/" 

	end

	def about
		
		@user = current_user
		
	end
end