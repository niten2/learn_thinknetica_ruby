module Accessor

  def attr_accessor_with_history(*names)
    value_history = '@value_history'

    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_get = "#{name}=".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method(var_name_get) do |value|

        instance_variable_set(value_history, {}) unless instance_variable_defined?(value_history)

        value_hist = instance_variable_get(value_history)
        value_hist[name] ||= []
        value_hist[name] << value

        instance_variable_set var_name, value

      end

      define_method("#{name}_history") do
          value = instance_variable_get(value_history)
          return [] if value.nil? || value[name].nil?
          value[name]
      end

    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        if value.class == type
          instance_variable_set(var_name, value)
        else
          raise "Please input correct type attribute"
        end
      end
  end

end




      # var_name = "@#{name}".to_sym
      # var_name_history = "#{name}_history".to_sym


      # self.define_method(name) { instance_variable_get(var_name) }

      # self.define_singleton_method("#{name}=".to_sym) do |value| instance_variable_set(var_name, value)


      #   instance_variable_set(var_name_history, [])
      #   history = instance_variable_get(var_name_history)
      #   history ||= []
      #   history << value




    # @@xxx
    # p "sadfsdfself.sdaf"

        # @history = []

        # @history << class_variable_set(var_name, value)


        # in_variable_set(var_name, value)
        # @history = value
        # class_variable_set(var_name, value)



# self.eval %w(#{name}_history".to_sym = [])

      # self.define_singleton_method(var_name_history) do
      #   # @history = []
      #   # @history = 0
      #   # @history << class_variable_get(var_name)
      #   @history
      # end
