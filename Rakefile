require 'yaml'
require 'csv'
require_relative 'lib/twitter_service'
require_relative 'lib/monkeylearn_service'

task :devexworld do
  cfg = YAML.load_file('config/secret.yml')
  hashtag = '#devexworld'

  # grab tweets and remove quotes
  ts = TwitterService
    .new(cfg['twitter_api_key'], cfg['twitter_api_secret'])
  tweets = ts.tweets_for_hashtag(hashtag)
  puts "Getting tweets for #{hashtag}"
  tweet_texts = tweets.map do |tweet|
    tweet.text.sub(/["'](.*?)["']/, '')
  end

  # classify tweet content
  puts 'Analyzing tweets & writing CSV'
  mls = MonkeylearnService
    .new(cfg['monkeylearn_classifier'], cfg['monkeylearn_api_token'])
  mls.analyze(tweet_texts, 'analyzed_tweets.csv')
end
