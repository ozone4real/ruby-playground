# class User

#   def name=(value)
#    @name = value
#   end

#   def name
#     @name
#   end
# end

# user = User.new
# user.name = "Ezenwa"
# p user.object
require "active_support/core_ext/string/inflections.rb"

str = gets.chomp
puts str.parameterize