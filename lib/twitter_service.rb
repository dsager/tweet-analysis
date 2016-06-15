require 'twitter'

class TwitterService
  attr_accessor :client

  def initialize(key, secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = key
      config.consumer_secret = secret
    end
  end

  def tweets_for_hashtag(hashtag)
    client.search("#{hashtag} -filter:retweets", lang: 'en')
  end
end
