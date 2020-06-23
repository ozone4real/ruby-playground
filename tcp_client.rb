require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)
s.write("GET / HTTP/1.1")
s.write("\r\n\r\n")

begin
  puts s.read_nonblock(3000)
rescue IO::WaitReadable
  IO.select([s])
  retry
end


# s.close                 # Close the socket when done

# pid = spawn("pg_dump shop_tight", out: 'shop_tight.sql')
# Process.wait pid
