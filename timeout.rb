require "timeout"

class DopeError < StandardError
end

begin
  Timeout.timeout(1, DopeError) do
    begin
      sleep 2
    rescue Timeout::Error
      puts "Exception"
    ensure
      puts "I am ensured"
    end
  end
rescue Timeout::Error => e
  puts "Timeout error"
end
