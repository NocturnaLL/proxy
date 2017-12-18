require File.expand_path('../APIProxy.rb', __FILE__)
require File.expand_path('../Logger.rb', __FILE__)
require 'rubygems'
require 'json'
class WeatherAPI<BaseApi
  def initialize(woeid)
    @number = woeid
    @uri = URI.parse("https://www.metaweather.com/api/location/")
    @uri = @uri+@number
    #/api/location/44418/
    @weather = getBody(@uri)
    @body = JSON.parse(@weather)
  end

  def execute
    puts @uri
    setData
    generalInfo
    tempInfo
  end

  def setData
    @weather_state_name = @body["consolidated_weather"][0]["weather_state_name"]
    @wind_direction_compass = @body["consolidated_weather"][0]["wind_direction_compass"]
    @min_temp = @body["consolidated_weather"][0]["min_temp"]
    @max_temp = @body["consolidated_weather"][0]["max_temp"]
    @the_temp = @body["consolidated_weather"][0]["the_temp"]
    @wind_speed = @body["consolidated_weather"][0]["wind_speed"]
    @humidity = @body["consolidated_weather"][0]["humidity"]
    @visibility = @body["consolidated_weather"][0]["visibility"]
    @predictability = @body["consolidated_weather"][0]["predictability"]
  end

  def tempInfo
    puts "min_temp: "+ @min_temp.to_s + " Celcius"
    puts "max_temp: "+ @max_temp.to_s + " Celcius"
    puts "current_temp: "+ @the_temp.to_s + " Celcius"
  end

  def generalInfo
    puts "weather_state_name: " + @weather_state_name
    puts "wind_direction_compass: " + @wind_direction_compass
    puts "wind_speed: "+ @wind_speed.to_s
    puts "humidity: "+ @humidity.to_s
    puts "visibility: "+ @visibility.to_s
    puts "predictability "+ @predictability.to_s
  end

end
