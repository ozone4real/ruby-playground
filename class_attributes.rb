require "active_support/core_ext/module.rb"
require "active_support/core_ext/class.rb"

# class SingletonClass

#   @@age = 24

#   class << self
#     attr_accessor :name
#     attr_accessor :age

#     @@age = 24

#     def full_name
#       "#{name} Ogbonna"
#     end
#   end

#   self.name = "nduka"
# end

# puts SingletonClass.full_name
# puts SingletonClass.age

# class CattrAccessor
#   cattr_accessor :name

#   @@name = "Ezenwa"
# end


# puts CattrAccessor.name

# class ClassAttribute
#   class_attribute :name

#   @@name = "Angela"
# end

# puts ClassAttribute.name


# class Base
#   class_attribute :properties
  
#   class << self
#     def property(key, v)
#       self.properties ||= {}
#       self.properties = properties.merge(key => v)
#     end
#   end
# end

# class B < Base
#   property("age", 50)
# end

# class C < B
#   property("height", 6)
# end

# class D < C
#   property("rich", true)
# end



# puts B.properties # {"age"=>50, "height"=>6, "rich"=>true}
# puts C.properties # {"age"=>50, "height"=>6, "rich"=>true}
# puts D.properties # {"age"=>50, "height"=>6, "rich"=>true}

class Classy
  class_attribute :positions

  def self.set_am
    "I don set am"
  end

  private_class_method :set_am

  def self.position(k, v)
    self.positions ||= {}
    self.positions[k] = v
    set_am
  end

  position("first", 1)
end
