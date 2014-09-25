class Tweet < ActiveRecord::Base

	def self.total_tweets_3days(ticker)
		self.where({ticker: (ticker), tweet_created_at: (3).day.ago..Time.now}).count
	end


	def self.sort_tweets_for_the_past_number_of_days(ticker, days)
		self.where({ticker: (ticker), tweet_created_at: (days).day.ago..Time.now}).order(:tweet_created_at).reverse_order   
	end

end