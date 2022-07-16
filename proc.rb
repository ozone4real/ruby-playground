require "active_support/core_ext/object.rb"

class Beta
  class << self
    def flag(key)
      define_singleton_method(key, &Proc.new)
    end
  end

  flag("intrusion") { "all" }
end

class Feature
  class << self
    def instance
      @hey ||= Hey.new
    end

    delegate :go, to: :instance
  end

  def initialize(feat)
    puts feat
  end

  def go
    puts "go"
  end
end

class Hey
  
end

p Feature.go


p Beta.intrusion
