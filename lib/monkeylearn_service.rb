require 'monkeylearn'

class MonkeylearnService
  attr_reader :classifier

  def initialize(classifier, api_token)
    @classifier = classifier
    Monkeylearn.configure { |c| c.token = api_token }
  end

  def classify(texts)
    Monkeylearn
      .classifiers
      .classify(classifier, texts, sandbox: true)
      .result
  end

  def analyze(texts, filename)
    CSV.open(filename, 'wb') do |csv|
      classify(texts).each_with_index do |classification, index|
        csv << ([texts[index]] + classification.first.values)
      end
    end
  end
end
