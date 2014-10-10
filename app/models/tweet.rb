class Tweet < ActiveRecord::Base

	# def self.count_total_tweets(ticker, days)
	# 	self.where({ticker: (ticker), tweet_created_at: (days).day.ago..Time.now}).count
	# end

	def self.tweet_count_array(ticker)
		[
		self.where({ticker: (ticker), tweet_created_at: 10.day.ago..9.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 9.day.ago..8.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 8.day.ago..7.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 7.day.ago..6.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 6.day.ago..5.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 5.day.ago..4.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 4.day.ago..3.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 3.day.ago..2.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 2.day.ago..1.day.ago}).count,
		self.where({ticker: (ticker), tweet_created_at: 1.day.ago..Time.now}).count
		]
	end
	def self.sort_tweets_for_the_past_number_of_days(ticker, days)
		self.where({ticker: (ticker), tweet_created_at: (days).day.ago..Time.now}).order(:tweet_created_at).reverse_order.order(:retweet_count).limit(9)   
	end

	def self.get_authorized		
		Twitter::REST::Client.new do |config|
			config.consumer_key        = Figaro.env.twitter_consumer_key
			config.consumer_secret     = Figaro.env.twitter_consumer_secret
			config.access_token        = Figaro.env.twitter_access_token
			config.access_token_secret = Figaro.env.twitter_access_token_secret
		end
	end

	def self.download_tweets(client, ticker)
		if Tweet.exists?(['ticker = ?', ticker])
			since_id = Tweet.where({ticker: (ticker)}).order(:tweet_id).last.tweet_id.to_i
		else
			since_id = Tweet.where({tweet_created_at: 3.day.ago..2.day.ago}).order(:tweet_id).last.tweet_id
		end
		client.search((ticker), :result_type => "mixed", :since_id => since_id).each do |tweet|
			unless Tweet.exists?(['tweet_created_at = ? AND user_id = ?', tweet.created_at, tweet.user.id])
				Tweet.create(
					:ticker => (ticker),
					:text => tweet.text, 
					:username => tweet.user.screen_name, 
					:user_id => tweet.user.id,
					:profile_img_url => tweet.user.profile_image_url.to_s,
					:retweet_count => tweet.retweet_count,
					:tweet_created_at => tweet.created_at,
					:tweet_id => tweet.id,
					:status_id => tweet.in_reply_to_status_id
					)
			end
		end
	end

end