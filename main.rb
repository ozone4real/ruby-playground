class Testing
  attr_accessor :name
  def initialize(name, &block)
    @name = name
  end

  def self.moan
    "shout loud"
  end

  def add_surname
    second_one = SecondOne.new
    second_one.fighter = "Pakau"
    @name = second_one
  end

  def pishaun
    "Skuki pishaun"
  end
end

class SecondOne
  attr_accessor :fighter
  def pakau
    "#{fighter} defeated by may weather"
  end
end

tst = Testing.new("eze")
tst.instance_eval do
  puts self
  def why?
    "because it has a long tail"
  end
end

puts tst.method(:why?).owner


# testing = Testing.new("ezenwa")

# testing.add_surname

# first = testing.clone

# puts first.name.pakau

# second = testing.dup
# puts first.name






