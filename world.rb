# class Ezenwa
#   class << self
#   end
# end

# class Person
#   def full_name(f_name, s_name)
#     "#{f_name} #{s_name}"
#   end
# end

# module Helps
#   def full_name
#     "fhhfhfjfjfj"
#   end
# end

# class Man < Person
#   include Helps
#   def full_name
#     "My name is #{super}"
#   end
#   def bio(func)
#     puts func.inspect
#     "I am an #{func}"
#   end
#   alias_method :details, :bio
#   alias_method :data, :bio
# end

# def mets(val)
#   "Experienced #{val}"
# end

# p Man.new.details(mets("Engineer"))

# def tryal(*arr)
#   p arr
# end
# tryal([4, 5, 7, 8])
# (1..3).tap {|val| p val.to_a }
# p File.expand_path(Dir["pidgin_spec/lib"][0])
# def panty
#   "God"
# end

# def ans(&block)
  
#   "#{block.call} is great" 
# end

# p ans {"God"}

# def parlay(name=(it_has = "yes"))
#   p it_has
# end

# parlay(it_has="yeeah")

# def blocktest
#   yield
# end

# blocktest do
#   puts "js".scan
# end

class Meth
  attr_reader :age, :height
  def initialize
    yield
  end
  def toast(block)
    block.call 24, 30
  end
end

handler = proc do |age, height|
  p self
  return 20
end

p handler.methods

meth = Meth.new handler.public_send
p meth




