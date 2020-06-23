class OOP
  def self.assign_var
    self.name = "nduka"
  end
  
  def self.pops
    p yepa
  end

  
  def initialize
    @table = {}
  end
  
  define_method :type do
    p "ya nor my type"
  end

  define_singleton_method :yepa do
    p "run away"
  end

  def generate
    define_singleton_method :yepa do
      p "run away"
    end
  end

  def get_it
    "#{concosant} no dull o"
  end

  def yepa
    "not a singleton"
  end

  private

  def concosant
    "odikwa germain"
  end
end

# australia = OpenStruct.new(country: "Australia", capital: "Canberra")
# p austrailia.country


oop = OOP.new
apata = OOP.new




class Param < OOP
  def trello
    "#{concosant} and concosant"
  end
end
cl = OOP.new

p cl.yepa
cl.generate





name, age = {name: "ezenwa", age: "24"}.values_at(name, age)

# p oop.papa
# p oop.instance