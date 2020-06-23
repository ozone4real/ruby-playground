require_relative './pidgin_spec/lib/pidgin_spec.rb'

PidginSpec.describe "Pidgin Test" do
  num = 30
  describe "Multiplication test" do
    e_go "test say multiplication dey work" do
      # test for positive result with 'go'
      expect_say(num * 5).go dey_equal_to(150)
    end
  end
  
  describe 'Division Test' do
    e_go "test say division dey work" do
      # test for negative result with 'no_go'
      expect_say(num/ 5).no_go dey_equal_to(6)
    end
  end

  
  # test for primitive types
  describe "Type test" do
    e_dey "test say the type correct" do
      str = "I am a boy"
      expect_say(str.split(' ')).go be(Array)
    end

    e_go "test say this stuff go end with something" do
      expect_say("7, 8, 9").go end_with(7, 9)
    end
  end
end