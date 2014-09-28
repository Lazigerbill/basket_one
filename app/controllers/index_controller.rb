class IndexController < ApplicationController
	def index

		ticker="$RY"
		@tweets = Tweet.sort_tweets_for_the_past_number_of_days(ticker, 3)
		@tweet_count = Tweet.count_total_tweets(ticker, 3)

		def load_quotes(ticker)
			url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22" + ticker + "%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
		 	resp = Net::HTTP.get_response(URI.parse(url))
		 	data = resp.body	
		 	result = JSON.parse(data)
		 	wiw = result['query']['results']['quote']['symbol']
		 	puts wiw
		end 

		load_quotes("MSFT")


	end




end