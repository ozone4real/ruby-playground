require "active_support/core_ext/module/concerning.rb"

class Hello
end

class WeConcerned
  def really
    puts "really?"
  end

  concerning :Concerned do
    def halla
      puts "I halla"
    end
  end
end

WeConcerned.new.halla
puts WeConcerned.new.method(:really)
