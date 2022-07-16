class Okrr

  def sowie
    killem
  end

  private
  def killem
    puts "I'm private"
  end
end

class Matter < Okrr
  def killem
    puts "I'm public"
  end
end

obj = Matter.new

def Okrr.sowie
  puts "I'm class method"
end

Okrr.sowie