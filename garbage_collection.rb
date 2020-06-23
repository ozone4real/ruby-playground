

require 'get_process_mem'
# GC.start
# p GC.stat.slice(:total_allocated_objects, :total_freed_objects)
# name = []
pid = fork {
  puts GC.stat
  name = []
  100000000.times {  name << "ezenwa".freeze }
  # p ObjectSpace.count_objects

  puts GC.stat

  mem = GetProcessMem.new
  puts mem.inspect
}

Process.wait(pid)

#   1000000000.times { name = "ezenwa" }
#   mem = GetProcessMem.new
#   puts mem.inspect
# }

# fork { 
#   arr = "ezenwa".split('')
#   arr.map(&:length)
#   mem = GetProcessMem.new
#   puts mem.inspect
# }

