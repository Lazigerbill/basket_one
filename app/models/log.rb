class Log < ActiveRecord::Base
	belongs_to :user

	def self.pricelookup(ticker)
		url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22'+ticker+'%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=showquote'
	    response = HTTParty.get(url)
	    response_adj = response.body[14..-3]
	    array = JSON.parse(response_adj)
	    @last_trade = array['query']['results']['quote']['LastTradePriceOnly']
		
	end
end
