# class Klass
#   attr_accessor :secret, :name
#   def initialize(name, &block)
#     @secret = 99
#     @name = name
#     if block_given?
#       instance_exec(self, &block)
#     end
#   end

#   def func(&block)
#     yield
#   end
# end
# k = Klass.new "nduka" do |age|
#   p age
# end

class TestMethods
  states = %w(lagos imo anambra ilorin)
  attr_accessor :value
  dablock = Proc.new {puts self}

  states.each do |state|
    define_method "#{state}?" do
      instance_eval(&dablock)
    end
  end
  
  # def create_method(name)
  #   self.class.define_method(name, dablock)
  # end

  private
  def self.inside_life
    "go to the five alive"
  end
end



class B < TestMethods
end

a = TestMethods.new
b = B.new

# a.create_method :babymo
a.value = "imo"
p a.lagos?
p b.lagos?
# a.babymo
# b.babymo
# p a.attrib
# b = TestMethods.instance_method(:suppl)
# binded = b.bind(a)
# p binded.call


# class Demo
#   def initialize(n)
#     @iv = n
#   end
#   def hello()
#     "Hello, @iv = #{@iv}"
#   end
# end

# k = Demo.new(99)
# m = k.method(:hello)
# p m.hello #=> "Hello, @iv = 99"
def frun(ass)
  num = 5
  if ass
    num += 10
  end
  num
end

p frun(true)
# p a.value

