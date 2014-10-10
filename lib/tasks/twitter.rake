namespace :twitter do
  	desc "ACCESS TWITTER REST API AND RETRIEVE TWEETS OF EACH TICKER SPECIFIED"
  	task download_tweets: :environment do
  		client = Tweet.get_authorized
  		# ticker_array = []
  		# Tweet.all.each do |tweet|
  		# 	ticker_array << tweet.ticker
  		# end
		Tweet.download_tweets(client, "$BKW")
		Tweet.download_tweets(client, "$HD")
		Tweet.download_tweets(client, "$TD")
		Tweet.download_tweets(client, "$WMT")
		Tweet.download_tweets(client, "$AAPL")
  	end

end

