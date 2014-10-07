namespace :twitter do
  	desc "ACCESS TWITTER REST API AND RETRIEVE TWEETS OF EACH TICKER SPECIFIED"
  	task download_tweets: :environment do
  		client = Tweet.get_authorized
		Tweet.download_tweets(client, "$TD")
		Tweet.download_tweets(client, "$WMT")
		Tweet.download_tweets(client, "$HD")
		Tweet.download_tweets(client, "$MSFT")
		Tweet.download_tweets(client, "$AAPL")
		Tweet.download_tweets(client, "$BBY")
		Tweet.download_tweets(client, "$YHOO")
  	end

end

