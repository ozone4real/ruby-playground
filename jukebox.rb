class Human
  attr_accessor :age, :gender, :race, :name

  def initialize(name, gender, race, age)
    @name = name
    @gender = gender
    @race = race
    @age = age
  end

  def isSingle
    true
  end

  def to_s
    "Name: #{@name}, Age: #{@age}, Gender: #{@gender}, Race: #{race}"
  end
end

class Mary < Human
  attr_accessor :boyfriend
  def initialize(name, gender, race, age, boyfriend)
    super(name, gender, race, age)
    @boyfriend = boyfriend
  end

  def to_s
    p @name
  end
end

# human = Human.new("John", "Male", "asian", 30)
mary = Mary.new("Mary", "Male", "asian", 30, 'John')


puts mary.name;
p mary.to_io
