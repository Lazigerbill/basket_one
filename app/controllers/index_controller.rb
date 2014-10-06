class IndexController < ApplicationController
	def index
		@user = current_user
		@stocks = []
		i = 0
		@user.stocks.all.each do |stock|
			@stocks << [stock.yahoo_symbol, i]
			i += 1
		end

		@quote_ticker = "TD"
		ticker = "$TD"
		# Tweet.download_tweets(Tweet.get_authorized, ticker)
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 7)
		# @tweet_count = Tweet.count_total_tweets(ticker, 7)
		@most_retweeted = @tweets.order("retweet_count DESC").first
		@tweet_array = Tweet.tweet_count_array(ticker)
	end

	def load
		@quote_ticker = index_params["ticker"]
		redirect_to root_url

		
	end

	private
	def index_params
		params.permit(:ticker)
	end


end