require File.expand_path('../WeatherApi.rb', __FILE__)
require File.expand_path('../QuestionApi.rb', __FILE__)
require File.expand_path('../UniversityApi.rb', __FILE__)
require File.expand_path('../Command.rb', __FILE__)
def main
  e = Event.new
  error = 0
  begin
    q = QuestionAPI.new
    e.addCommand(q)
    e.execute(0)
  rescue
    puts "QuestionAPI error"
    error = 1
  end
  answer = gets.chop
  #e.executeAll
  if (error == 1 || q.checkAnswer?(answer))
    if (error == 0)
    puts "Correct Answer!!!"
    puts "---------------------------------"
    puts "Congratulation, you have won scholarship"
  end
    puts "Enter a country and name to specify your university"
    puts "Enter a country:"
    country = gets.chop
    puts "Enter a name:"
    name = gets.chop
    puts "So you want to study in #{name} thats great!!!"
    begin
    u = UniversityApi.new(name,country)
    e.addCommand(u)
    e.execute(1)
    rescue
      puts "UniversityAPI error"
    end
    puts "---------------------------------"
    puts "Enter the woeid for city"
    woeid = gets.chop
    begin
    w = WeatherAPI.new(woeid)
    e.addCommand(w)
    puts "Lets see the weather in city"
    e.execute(2)
    rescue
      puts "WeatherAPI error"
    end
  else
    puts "Wrong Answer :("
  end
end

main
