require 'rack'
require 'json'
require "pry"

app = lambda {|env|
  # binding.pry
  return [ 200, { "Content-Type" => "text/html" }, ["<h1>Hey dear</h1>"] ]
} 

Rack::Handler::WEBrick.run app