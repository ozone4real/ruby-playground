require "active_support/core_ext/object"

class TryDatShit
  def hello
    raise "bastard"
  end
end

puts TryDatShit.new.try(:wiun)