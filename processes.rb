rd, wr = IO.pipe

pid1 = fork {
  Thread.new {
    IO.select([rd])
    puts "I don dey go o #{$$}"
    exit! 1
  }

  Thread.new {
    puts "Now way no"
  }
  while true
    sleep 1
    puts "I am process #{$$}"
  end
}

pid2 = fork {
  Thread.new {
    IO.select([rd])
    puts "I don dey go o #{$$}"
    exit! 1
  }

  Thread.new {
    puts "You see it now"
  }
  while true
    sleep 1
    puts "I am process #{$$}"
  end
}

sleep 10

wr.write("iisiis")




# Signal.trap("INT") do
#   puts "I am exiting"
#   exit 1
# end

# Process.wait(pid)
# puts "I am still waiting"

# puts data