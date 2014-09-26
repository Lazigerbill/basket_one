class IndexController < ApplicationController
	def index

		ticker="$CM"
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 1)
		@tweet_count = Tweet.count_total_tweets(ticker, 3)
	end




end