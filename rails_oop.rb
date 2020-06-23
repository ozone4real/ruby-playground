require 'active_support/core_ext/module'
require 'active_support/core_ext/class/subclasses.rb'
require 'active_support/core_ext/class/attribute.rb'

class RailsOOP
  # @@name = "Ezenwa"
  # cattr_accessor :name, :age
  
end

module Child
  def self.full_name
    "#{@@name} ogbonna"
  end

  protected

  def name=(value)
    @name = value
    puts "yeeepeee"
  end
end

class Person
  include Child
  def change_person
    self.name = "Ezenwa"
    define_singleton_method(:phony) do
      "you are phony"
    end
  end
end

ps = Person.new
ps.change_person


class Proto < Person
  def self.prots
    "Protttd"
  end

end

p ps.phony
p Proto.new.phony

responds = Proto.singleton_class do
  method_defined? :prots
end

p responds


