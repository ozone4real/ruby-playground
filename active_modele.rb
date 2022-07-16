require("active_model")

class Model
  include ActiveModel::Model
  attr_accessor :name
end

model = Model.new(name: "ezenwa")
puts model.to_key

