require 'ostruct'

class MetPrac
  def self.call
    scream = OpenStruct.new
    def scream.loud
      "yeeeeah"
    end
    OpenStruct.new(scream: scream)
  end
end

puts MetPrac.new

class Callehone
  def self.hone
    "I am callehone"
  end
  class << self
    def choreo(meth)
      singleton_class.class_eval do
        p self
      end
    end
  end
end

