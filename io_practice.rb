
# th << Thread.new {
#   puts "radarada"
# }
require "thwait"
semaphore = Mutex.new
varia = ConditionVariable.new


arr = []

th1 = Thread.new {
  
  semaphore.synchronize {
    while true
      arr << arr.fetch(-1, 0) + 5
      arr.length > 500 && varia.wait(semaphore)
      break if arr.length > 1000
    end
  }
}

th2 = Thread.new {
  semaphore.synchronize {
    while true
      arr << arr.fetch(-1, 0) + 3
      break if arr.length > 1000
    end
    varia.signal
  }
}

puts th1, th2, Thread.main
th1.join
th2.join


p arr

