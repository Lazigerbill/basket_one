namespace :twitter do
  	desc "ACCESS TWITTER REST API AND RETRIEVE TWEETS OF EACH TICKER SPECIFIED"
  	task download_tweets: :environment do
  		client = Tweet.get_authorized
		Tweet.download_tweets(client, "$TD")
		Tweet.download_tweets(client, "$NA")
		Tweet.download_tweets(client, "$BMO")
		Tweet.download_tweets(client, "$RY")
		Tweet.download_tweets(client, "$CM")
		Tweet.download_tweets(client, "$BNS")
		Tweet.download_tweets(client, "$YHOO")
  	end

end

