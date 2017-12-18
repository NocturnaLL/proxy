require File.expand_path('../APIProxy.rb', __FILE__)
require File.expand_path('../Logger.rb', __FILE__)
require 'rubygems'
require 'json'
class QuestionAPI<BaseApi
  def initialize()
    @uri = URI.parse('https://opentdb.com/api.php?amount=1')
    q=getBody(@uri)
    #@question = BaseApi.new('https://opentdb.com/api.php?amount=1')
    @body = JSON.parse(q)
    @results = @body["results"]
  end

  def execute
    puts @uri
    getStatus
    configures
    puts getQuestion
    getAnswers
  end

  def configures()

    puts "Category: "+@results[0]["category"]
    puts "Difficuly: "+@results[0]["difficulty"]
  end

  def checkAnswer?(answer)
    answer==@results[0]["correct_answer"]
  end

  def getQuestion
    @results[0]["question"]
  end

  def correctAnswer
    @results[0]["correct_answer"]
  end

  def getAnswers
    puts "a) " +@results[0]["correct_answer"]
    puts "b) " +@results[0]["incorrect_answers"][0]
    if (@results[0]["incorrect_answers"][1]!=nil)
      puts "c) " +@results[0]["incorrect_answers"][1]
    end
    if (@results[0]["incorrect_answers"][2]!=nil)
      puts "d) " +@results[0]["incorrect_answers"][2]
    end
  end
end
