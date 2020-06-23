require 'benchmark'

class Repo
  p self
  attr_accessor :name, :age, :height, :folks
  def initialize(name, age, height, &block)
    @name = name
    @age = age
    @height = height

    if block_given?
      if block.arity == 1
        instance_exec(self, &block)
      else
        instance_eval(&block)
      end
    end
  end

  def action
    "please run"
  end
end

repo = Repo.new("kevin", "27", "6ft") do
  self.folks = "many"
  p "#{name} is #{age} so #{action} with #{folks}" 
end

p repo.folks

def take_args(**args)
  p args[:name]
end

take_args(name: "ezenwa", age: 24)



a = (1..100000).map { rand(100000) }

Benchmark.bm(10) do |b|
  b.report("Sort") { a.sort }
  b.report("Sort by") { a.sort_by { |a| a } }
end

"kkk".bytesize