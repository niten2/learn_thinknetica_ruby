module InstanceCounter
  @@count_instans_class = 0
  def initialize(name)
    @@count_instans_class += 1
  end


  def instances
    puts "COUNT = #{@@count_instans_class}"
    # puts "asdfasdfsadf"
  end

private

  def register_instance
  end



end
