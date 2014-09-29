class IndexController < ApplicationController
	def index

		ticker = "$TD"
		quote_ticker = "TD.TO"
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 7)
		@tweet_count = Tweet.count_total_tweets(ticker, 7)



	end




end