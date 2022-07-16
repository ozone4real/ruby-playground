# require 'ostruct'

# class MetPrac
#   def self.call
#     scream = OpenStruct.new
#     def scream.loud
#       "yeeeeah"
#     end
#     OpenStruct.new(scream: scream)
#   end
# end

# puts MetPrac.new

# class Callehone
#   def self.hone
#     "I am callehone"
#   end
#   class << self
#     def choreo(meth)
#       singleton_class.class_eval do
#         p self
#       end
#     end
#   end
# end

class Query
  def initialize
    @size = nil
    @data = []
  end

  def size(size)
    @size = size
    self
  end

  def data(data)
    @data = data
    self
  end
end

class QueryProxy
  def query_instance
    Query.new
  end

  def query
    @query ||= query_instance.size(4).data(["egg", "rice"])
  end
end


qp = QueryProxy.new
p qp.query
qp.query.size(5)
p qp.query