class IndexController < ApplicationController
	def index

		ticker = "$YHOO"
		@quote_ticker = "YHOO"
		# Tweet.download_tweets(Tweet.get_authorized, ticker)
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 7)
		@tweet_count = Tweet.count_total_tweets(ticker, 7)
		@most_retweeted = @tweets.order("retweet_count DESC").first
		@tweet_array = Tweet.tweet_count_array(ticker)



	end




end