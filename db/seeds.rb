# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Stock.create(yahoo_symbol: 'YHOO', twitter_symbol: '$YHOO', company_name: 'Yahoo! Inc.')
	Stock.create(yahoo_symbol: 'MSFT', twitter_symbol: '$MSFT', company_name: 'Microsoft Corporation')
	Stock.create(yahoo_symbol: 'CSCO', twitter_symbol: '$CSCO', company_name: 'Cisco Systems, Inc.')

	# Stocks_user.create(user_id: 3, stock_id: 1)
	# Stocks_user.create(user_id: 3, stock_id: 2)
	# Stocks_user.create(user_id: 3, stock_id: 3)