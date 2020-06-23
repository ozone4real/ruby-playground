$LOAD_PATH << "."
require "crud"
users = [
    { username: 'ozonkwo', password: 'ozone4real' },
    { username: 'divine', password: 'divine1960' },
    { username: 'efeagare', password: 'efe2019' },
    { username: 'tiku', password: 'tiku1901' },
    { usename: 'dapo', password: 'ibididadipo' }
  ]

class Student < Crud::Calc::Kiki
    # include Crud::Calc

    attr_accessor :first_name, :age, :stacks, :last_name, :password

    def initialize(firstname, lastname, age, stacks, password)
        @first_name = firstname
        @last_name = lastname
        @age = age
        @stacks = stacks
        @password = password
    end

    def callbastards
        "#{bastards} don't @ me"
    end

    def to_s
        "First name: #{@first_name}, Last name: #{@last_name}, Age: #{@age}, Stacks: #{@stacks}"
    end
end

ezenwa = Student.new("Ezenwa", "Ogbonna", 24, %w(javascript, ruby, python), "ozone4real")
ezenwa.first_name = "Nduka"
nduka = Student.new("Nduka", "Ogbonna", 23, %w(javascript, Java, C++), "chinko")
arr_obj = [ezenwa, nduka]
p ezenwa.callbastards
