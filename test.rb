require "benchmark"

def solution(a)
  middle = a[1...-1]

  chains = []

  middle.each_with_index do |d, i|
    (i + 2).upto(middle.length - 1) do |j|
      chains.push(d + middle[j])
    end
  end

  chains.sort.first
end

arr = (1..10000).to_a

p Benchmark.realtime { solution(arr) }