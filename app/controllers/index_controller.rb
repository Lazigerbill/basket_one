class IndexController < ApplicationController
	def index
		@user = current_user
		@stocks = []
		@user.stocks.all.each do |stock|
			@stocks << stock.yahoo_symbol
			@stocks.sort!
		end

		@quote_ticker = if params[:ticker].present?
			params[:ticker]
		else
			@stocks[0]
		end
		twitter_ticker = "$" + @quote_ticker.to_s



		# Tweet.download_tweets(Tweet.get_authorized, twitter_ticker)
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(twitter_ticker, 7)
		# @tweet_count = Tweet.count_total_tweets(ticker, 7)
		@most_retweeted = @tweets.order("retweet_count DESC").first
		@tweet_array = Tweet.tweet_count_array(twitter_ticker)
	end
end