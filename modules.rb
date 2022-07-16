require "active_support/concern"

module Jamexan
  extend ActiveSupport::Concern
  included do
    GRAVY = "GRAVY"
    puts "yellp"
  end
end

module Ihenne
  extend ActiveSupport::Concern

  # class_eval do
  #   puts "yu know"
  # end

  included do
    puts "never"
  end

  include Jamexan
end


class Rexnol
  include Ihenne
end


Jamexan
# puts Rexnol::GRAVY

# puts Jamexan::GRAVY

