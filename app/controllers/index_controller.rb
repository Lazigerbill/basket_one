class IndexController < ApplicationController
	def index

		ticker="$RY"
		@client = Tweet.get_authorized
		Tweet.download_tweets(@client, ticker)
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 3)
		@tweet_count = Tweet.total_tweets_7days(ticker)
	end




end