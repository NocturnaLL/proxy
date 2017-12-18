require 'singleton'

class Logger
  include Singleton

  def initialize
    @log = File.open("log.json","a")
  end

  def log(msg)
    @log << msg
  end
end
