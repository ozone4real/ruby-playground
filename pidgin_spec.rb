require "colorize"

class Expect
  class NoMatcherError < StandardError
  end

  def initialize(value, klass, self_klass, spec_statement, des_statement)
    @klass = klass
    @value = value
    @des_statement = des_statement
    @spec_statement = spec_statement
    @self_klass = self_klass
  end

  def go(matcher)
    if matcher.matches?(@value)
      @klass.pass_count += 1
    else
      @klass.fail_count += 1
      @klass.failure_messages << {
        description: "#{@des_statement} #{@spec_statement}",
         message: matcher.failure_message
        }
      @self_klass.passed = false
    end
  end

  def no_go(matcher)
    if !matcher.matches?(@value)
      @klass.pass_count += 1
    else
      @klass.fail_count += 1
      @klass.failure_messages << {
        description: "#{@des_statement} #{@spec_statement}",
         message: matcher.failure_message_when_negated
        }
      @self_klass.passed = false
    end
  end
end


module Matchers
  class BaseMatcher
    def initialize(expected)
      @expected = expected
    end
  end
end

module Matchers
  class DeyEqualTo < BaseMatcher

    def matches?(value)
      @value = value
      @expected == value
    end

    def failure_message_when_negated
      "You bin dey expect say #{@value} no go equal #{@expected}, but e con equal"
    end

    def failure_message
      "You bin dey expect #{@expected} but na #{@value} dey hia o"
    end
  end

  class Be < BaseMatcher
    def matches?(value)
      @value = value
      @value.is_a? @expected
    end

    def failure_message_when_negated
      "I bin dey expect say #{@value} no go be #{@expected}, but e con be #{@expected}"
    end

    def failure_message
      "I bin dey expect #{value} go be #{@expected} but e no be am at all"
    end
  end

  # class Contain < BaseMatcher
  #   def matches?(value)
  #     @value = value
  #     unless value.is_a? Array raise "Can't"
  #   end
  # end
end


module Matchers
  def be(expected)
    Be.new(expected)
  end 

  def dey_equal_to(expected)
    DeyEqualTo.new(expected)
  end
end


class ExampleGroup
  def initialize(des_statement, klass, &block)
    @des_statement = des_statement
    @klass = klass
    instance_eval(&block)
  end
  def e_go(spec_statement, &block)
    Example.new(@des_statement, spec_statement, @klass, &block)
    @spec_statement = spec_statement
  end
  alias_method :e_dey, :e_go
end

class Example
  include Matchers
  attr_accessor :passed
  def initialize(des_statement, spec_statement, klass, &block)
    @passed = true
    @spec_statement = spec_statement
    @des_statement = des_statement
    klass.spec_count += 1
    @klass = klass
    @self_klass = self
    instance_eval(&block)
    print '.'.send(@passed ? 'green' : 'red')
  end
  def expect_say(value)
    Expect.new(value, @klass, @self_klass, @spec_statement, @des_statement)
  end
end



class PidginSpec
  def self.describe(&block)
    new(&block)
  end

  attr_accessor :fail_count, :pass_count, :failure_messages, :passed, :spec_count
  def initialize(&block)
    @pass_count = 0
    @fail_count = 0
    @spec_count = 0
    @failure_messages = []
    instance_eval(&block) 
    puts "\n#{@spec_count} tests run, #{@fail_count} fail#{"\n\nFailures:\n" if fail_count.nonzero?}".send(@fail_count.zero? ? 'green' : 'red')
    @failure_messages.each_with_index {|m, index| 
      puts "#{index + 1}. #{m[:description]}"
      puts m[:message].red
    }
  end

  def describe(des_statement, &block)
    ExampleGroup.new(des_statement, self, &block)
  end
end