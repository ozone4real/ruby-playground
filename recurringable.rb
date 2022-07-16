require("timeout")

class Job
  attr_reader(:count)

  def initialize
    @count = 0
    @mutex = Mutex.new
  end

  def 
end