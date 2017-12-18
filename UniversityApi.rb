require File.expand_path('../APIProxy.rb', __FILE__)
require File.expand_path('../Logger.rb', __FILE__)
require 'rubygems'
require 'json'
class UniversityApi<BaseApi
  def initialize(name,country)
    @name=name
    @country=country
    @uri =  URI.parse("http://universities.hipolabs.com/search?name")
    @uri.query = [@uri.query, @name].compact.join('=')
    @uri.query = [@uri.query, "country"].compact.join('&')
    @uri.query = [@uri.query, @country].compact.join('=')
    @response_body = getBody(@uri)
  end

  def execute
    puts @uri.to_s
    getStatus
    puts @response_body
  end

end
