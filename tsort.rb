require "tsort"

class Collection < Array
   include(TSort)
  alias :tsort_each_node :each

  def tsort_each_child(child, &block)
    select {|i| i[:before] == child[:name] || child[:after] == i[:name] }.each(&block)
  end

  def +(other)
    Collection.new(to_a + other.to_a)
  end
end

collection = Collection.new

collection << {name: "ogadi", after: "eze"}
collection << {name: "baby", before: :zze}
collection << {name: "eze"}
collection << {name: "nduka", before: "eze"}
collection << {name: "chinenye", after: "ogadi"}
collection << { name: "chigaemezu", before: "nduka" }

{"ogadi" => ["eze"], "baby" => [], "eze" => ["nduka"], "nduka" => ["chigaemezu"], "chinenye" => ["ogadi"]}

["chigaemezu", "nduka", "eze", "ogadi", "baby", "chinenye"]


puts collection.tsort