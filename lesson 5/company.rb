module Company
  attr_accessor :name_company

  def name_company
    if @name_company.nil?
      puts "У этот обьект никто не произвел"
    else
      puts "Производитель этого обьекта #{@name_company}"
    end
  end

  def name_company_set(name)
    @name_company = name
  end

end
