require "socket"

PATH = "socket.sock"

File.unlink(PATH) if File.exists?(PATH)
server = UNIXServer.new(PATH)

Thread.abort_on_exception = true

loop do
  client = server.accept

  puts "New request accepted"

  Thread.new do
    # Use recv instead of readpartial to avoid EOFError when client closes
    data = client.recv(1000).strip

    if data == "STREAM"
      loop do
        client.puts "Hello, world! #{Random.rand}"  
        sleep 2
      end
    else
      puts data
      # client.puts "Hello, world! #{Random.rand}"
      client.close
    end
  rescue Errno::EPIPE
    puts "Client disconnected"
    client.close
  end
rescue SignalException
  File.unlink(PATH)
  exit(0)
end