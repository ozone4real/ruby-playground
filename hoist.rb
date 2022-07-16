def hoist
  puts "hssh"
end

def no_way
  hoist = hoist
  puts hoist
end

puts no_way