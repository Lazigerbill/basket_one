class IndexController < ApplicationController
	def index
		@tweets = Tweet.where(:tweet_created_at => 1.day.ago..Time.now).order(:tweet_created_at).reverse_order
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "KWfNGEf1dfGMJZ5qZNOsQJ1ap"
		  config.consumer_secret     = "YU9EPrGwgdjv1ujt6HVxo7jrMbbgs5gabUeeaXHQF59IwLi9Rf"
		  config.access_token        = "2748660599-MY1es3v57JkwGFH7GI5e4gxC4xtJVsInggx5ZEB"
		  config.access_token_secret = "AUG3Mv8VzNAZZotIag0jVzCri7oo5Abiqloeb5k949Dmh"
		end
		@client.search("$BMO ", :result_type => "mixed", :location => "Toronto").take(300).each do |tweet|
			# tweet_created_at = DateTime.parse(tweet.created_at)
			unless Tweet.exists?(['tweet_created_at = ? AND user_id = ?', tweet.created_at, tweet.user.id])
				@tweet = Tweet.new
				@tweet.update_attributes(
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