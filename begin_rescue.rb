def nobrainer(data)
  begin
    raise "Never ever" unless data
  rescue => exception
    puts exception.class
  else
    puts "I survived"
  end
end

nobrainer nil