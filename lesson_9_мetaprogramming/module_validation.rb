module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      validates_name = '@validates'
      instance_variable_set(validates_name, {}) unless instance_variable_defined?(validates_name)
      instance_variable_get(validates_name)[name] = *args
    end
  end

  module InstanceMethods

    def validate!
      self.class.instance_variable_get('@validates').each do |name, args|
        send("validate_#{args[0]}", name, *args[1, args.size])
      end
      true
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end

    private

    def validate_presence(name)
      value = instance_variable_get("@#{name}")
      fail 'Argument is empty string' if value.nil? || value.empty?
    end

    def validate_format(name, format, message='Invalid format')
      value = instance_variable_get("@#{name}")
      fail ArgumentError, message unless value =~ format
    end

    def validate_type(name, type, message='Invalid type')
      type_class = instance_variable_get("@#{name}").to_s
      fail ArgumentError, message if type_class != type
    end
  end
end
