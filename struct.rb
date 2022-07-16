Struct.new("GreatStruct", :name, :age) do
  def self.details(other)
    puts "He loves #{other}"
  end

  details("food")
end

class DopeStruct < Struct::GreatStruct

  details("girls")
end

d = DopeStruct.new
p d.name
d.name = "ezenwa"
p d.name