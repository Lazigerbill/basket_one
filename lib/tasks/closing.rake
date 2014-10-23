namespace :stock do
  	desc "DOWNLOAD LAST TRADED PRICES FOR STOCKS"
  	task download_closing: :environment do
  		@stocks = Stock.all
  		@stocks.each do |stock|
  			if Stock.pricelookup(stock.yahoo_symbol) != nil
  				stock.update(last_trade_price: Stock.pricelookup(stock.yahoo_symbol))
  			end
  		end
  	end
end
