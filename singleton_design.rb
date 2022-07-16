require("singleton")

class Pere
  include(Singleton)

  attr_accessor :name

end

p = Pere.instance
p.name = "Pere"

g = Pere.instance

puts g.name