namespace :twitter do
  	desc "ACCESS TWITTER REST API AND RETRIEVE TWEETS OF EACH TICKER SPECIFIED"
  	task download_tweets: :environment do
  		client = Tweet.get_authorized
  		Stock.all.each do |stock|
  			ticker = stock.yahoo_symbol
        Tweet.download_tweets(client, ticker)
  		end
	
  	end

end

