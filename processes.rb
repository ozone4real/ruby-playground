rd, wr = IO.pipe

pid1 = fork {
  trap("INT") {
    puts "No process #{$$} will continue"
  }

  trap("INT") {
    puts "Yes process #{$$} will stop"
    raise SignalException "INT"
  }

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
  trap("INT") {
    puts "No process #{$$} will continue"
  }
  
  trap("INT") {
    puts "Yes process #{$$} will stop"
    raise SignalException "INT"
  }

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

  trap("INT") {
    puts "No process #{$$} will continue"
  }
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