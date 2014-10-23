# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
set :environment, :development
set :path, '/Users/Bill/desktop/Assignments/final'
set :output, "#{path}/log/cron.log"
# set :environment, :development


every 20.minutes do
  rake "twitter:download_tweets"
end

every 20.minutes do 
	rake "stock:download_closing"
	rake "rake log:daily_valuation"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
