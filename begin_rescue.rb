require "ostruct"

def nobrainer(data)
  # begin
    raise "Never ever" unless data
    name = data
  # rescue => exception
  #   puts exception.class
ensure
    puts "I am #{name&.name}"
end

nobrainer nil
