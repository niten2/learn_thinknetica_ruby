module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  # attr_accessor :count
  @@count = 0

    def instances
      puts "Количество станций = #{@@count} шт."
    end

    def count
      @@count += 1
    end

  end

  module InstanceMethods

    protected
      def register_instance
        self.class.count
      end
  end

end


