# rd, wr = IO.pipe

# while true
#   rd.read
  
# end

def hashes(**h)
  puts h
  {name: "eze"}.merge(h)
end

puts hashes