class TestSingleton
  def hey
    define_singleton_method :hey do
      @user
    end
    @user = "First time"
  end
end

class ChildSingleton < TestSingleton

end

test_singleton = ChildSingleton.new
p test_singleton.hey
p test_singleton.hey