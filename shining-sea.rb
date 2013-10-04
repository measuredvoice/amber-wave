require 'rubygems'
require 'bundler/setup'

require 'rest-client'
require 'twitter'
require 'aws-sdk'
require 'multi_json'
require 'boxer'
require 'active_support/all'
require 'csv'

require_relative './config/too_many_secrets'

require_relative './app/model/model'
require_relative './app/model/s3_storage'
require_relative './app/model/account'
require_relative './app/model/tweet_metric'
require_relative './app/model/metrics_file'
require_relative './app/model/daily_summary'
require_relative './app/model/weekly_summary'
require_relative './app/model/monthly_summary'
require_relative './app/model/account_summary'
require_relative './app/model/tweet_summary'
require_relative './app/model/rank'
require_relative './app/model/daily_ranking'

require_relative './app/boxes/metrics'
require_relative './app/boxes/summaries'

Twitter.configure do |config|
  config.consumer_key    = ENV['TWITTER_CLIENT_KEY']
  config.consumer_secret = ENV['TWITTER_CLIENT_SECRET']
  config.bearer_token    = Twitter.token
end

Time.zone = "Eastern Time (US & Canada)"
