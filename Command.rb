class Command
  def initialize
    raise NotImplementedError
  end
  def execute()
    raise NotImplementedError
  end
  def executeAll()
    raise NotImplementedError
  end
end

class Event<Command
  def initialize
    @commands = []
  end

  def addCommand(c)
    @commands << c
  end

  def execute(c)
    @commands[c].execute
  end

  def executeAll()
    @commands.each do |c|
      c.execute
    end
  end
end
