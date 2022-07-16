require "socket"

PATH = "socket.sock"

class ThreadPool
  attr_reader(:mutex, :cv, :tasks, :min_threads, :max_threads, :threads, :tasks)
  attr_accessor(:waiting)

  def initialize(min_threads: 5, max_threads: 5)
    @mutex = Mutex.new
    @cv = ConditionVariable.new
    @waiting = 0
    @tasks = []
    @min_threads = min_threads
    @max_threads = max_threads

    @threads = min_threads.times.map { spawn_thread }
  end

  def spawn_thread
    Thread.new do
      while true
        task = nil
        mutex.synchronize do
          while tasks.empty?
            @waiting += 1
            cv.wait(mutex)
            @waiting -= 1
          end
          task = tasks.shift
        end

        task.process
      end
    end
  end

  def <<(work)
    mutex.synchronize do
      # puts "pool capacity: #{pool_capacity}"
      # puts "waiting: #{waiting}"
      # puts "threads: #{threads.length}"
      # puts "backlog: #{tasks.length}"
      threads << spawn_thread if spawn_more?
      tasks.push(work)
      cv.signal
    end
  end

  def pool_capacity
    (max_threads - threads.length) + waiting
  end

  def spawn_more?
    waiting < 1 && threads.length < max_threads
  end
end


class Work
  def process
    "Processing work in #{Thread.current}"
    70000000.times do
      
    end
  end
end

class Server
  attr_reader :socket, :thread_pool

  def initialize(thread_pool)
    File.unlink(PATH) if File.exists?(PATH)
    @socket = UNIXServer.new(PATH)
    @thread_pool = thread_pool
  end

  def run
    loop do
      Thread.start(socket.accept) do |client|
        puts "Processing new request"
        # Use recv instead of readpartial to avoid EOFError when client closes
        data = client.recv(1000).strip

        if data == "STREAM"
          loop do
            print_stats(client)
            sleep 2
          end
        else
          print_stats(client)
          client.close
        end
      rescue Errno::EPIPE
        puts "Client disconnected"
        client.close
      end
    end
  rescue SignalException => e
    socket.close
  end

  def print_stats(client)
    client.puts "pool capacity: #{thread_pool.pool_capacity}"
    client.puts "waiting: #{thread_pool.waiting}"
    client.puts "threads: #{thread_pool.threads.length}"
    client.puts "backlog: #{thread_pool.tasks.length}"
  end
end


class Launcher
  attr_reader :thread_pool

  def initialize(thread_pool: nil)
    @thread_pool = thread_pool || ThreadPool.new(min_threads: 5, max_threads: 8)
  end

  def launch
    Thread.new do
      Server.new(thread_pool).run
    end

    while true
      sleep 1
      thread_pool << Work.new
    end
  end
end



Launcher.new.launch




# require "thwait"
# semaphore = Mutex.new
# varia = ConditionVariable.new


# arr = []

# th1 = Thread.new {
  
#   semaphore.synchronize {
#     while true
#       puts "waiting thread 1"
#       arr << arr.fetch(-1, 0) + 5
#      if arr.length > 100
#       varia.signal
#      end
#       break if arr.length > 200
#     end
#   }
# }

# th2 = Thread.new {
#   semaphore.synchronize {
#     while true
#       puts "waiting thread 2"
#       # deadlock occurs when a thread releases the lock on the mutex (with a CV) but there are no other threads awake to acquire the lock.
#       varia.wait(semaphore)
#       arr << arr.fetch(-1, 0) + 3
#       varia.signal if arr.length > 100
#       break if arr.length > 300
#     end
#   }
# }

# semaphore.synchronize { while true; end }

# puts th1, th2
# # puts th1, th2, Thread.main
# th1.join
# th2.join


# p arr


