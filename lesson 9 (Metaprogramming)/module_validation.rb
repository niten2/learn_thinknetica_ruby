module Validation

  # def validate(options = {})
  def validate(name, *args)

    @name = name
    @args = args

    # p @name
    # p @args

    if @args[0] == :presence
      fail "Name can't be nil or \'\'" if name.nil? || name == ""
    end

    if @args[0] == :format
      fail 'Number has invalid format' if number !~ @args[1]
    end

    if @args[0] == :format
      fail 'Number has invalid format' if number !~ @args[1]
    end



  # def validate!
  #   fail "Number can't be nil" if number.nil?
  #   fail 'Number has invalid format' if number !~ NUMBER_FORMAT
  #   fail 'Type should be cargo or passenger' unless type_not_cargo_or_passenger
  #   fail 'Number can not be the same' unless @@tain_list[number].nil?
  #   true
  # end


    # p "#{option} DSFASDFSAFSDF"
    # p type


    # if type == :presence
    #   if name == "" || name == nil
    #     raise "Input correcte NAME"
    #   end

    # # elsif  format


    # # elsif      type

    # else
    #   raise "Input correct Type Validation"
    # end



  end

  def validate!
  end

  def valid?
  end

end
