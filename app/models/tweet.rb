class Tweet < ActiveRecord::Base

	def self.count_total_tweets(ticker, days)
		self.where({ticker: (ticker), tweet_created_at: (days).day.ago..Time.now}).count
	end

	def self.sort_tweets_for_the_past_number_of_days(ticker, days)
		self.where({ticker: (ticker), tweet_created_at: (days).day.ago..Time.now}).order(:tweet_created_at).reverse_order   
	end

	def self.get_authorized		
		Twitter::REST::Client.new do |config|
			config.consumer_key        = Rails.application.secrets.twitter_consumer_key
			config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
			config.access_token        = Rails.application.secrets.twitter_access_token
			config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
		end
	end

	def self.download_tweets(client, ticker)
		client.search((ticker), :result_type => "mixed").each do |tweet|
			unless Tweet.exists?(['tweet_created_at = ? AND user_id = ?', tweet.created_at, tweet.user.id])
				Tweet.create(
					:ticker => (ticker),
					:text => tweet.text, 
					:username => tweet.user.screen_name, 
					:user_id => tweet.user.id,
					:profile_img_url => tweet.user.profile_image_url.to_s,
					:retweet_count => tweet.retweet_count,
					:tweet_created_at => tweet.created_at
				)
			end
		end
	end

end