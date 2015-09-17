module Accessor

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@@#{name}".to_sym
      define_method(name) { class_variable_get(var_name) }

      define_method("@@#{name}=".to_sym) do |value|
       class_variable_set(var_name, value)
      end

    end
  end

  def strong_attr_accessor
    # @@xxx
    # p "sadfsdfself.sdaf"
  end

end







