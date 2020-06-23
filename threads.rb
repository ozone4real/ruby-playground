threads = []
mutex = Mutex.new

threads << Thread.new { 3.times {|i| p "Threads are fun!" } }
# threads << Thread.new { sleep 2 }
threads << Thread.new { puts "Na dem dey rush us" }
threads << Thread.new { puts "Whats the big deal" }


threads.each { |thr|
  p thr, thr.status, thr.alive?
  thr.join
  # thr.run
  # thr.kill
  # p thr.status
  # p thr.alive?
}

f = File.new
f.readline