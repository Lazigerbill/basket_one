# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
# set :path, '/Users/Bill/desktop/Assignments/final'
set :environment, :development
set :output, "#{path}/log/cron.log"



every 20.minutes do
	rake "twitter:download_tweets"
end

every 20.minutes do 
	rake "stock:download_closing"
	rake "log:daily_valuation"
end

every :weekday, :at => '11:00 pm' do
	rake "stock:download_closing"
end

every :weekday, :at => '11:30 pm' do
	rake "log:daily_valuation"
end

