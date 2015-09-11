module Company
  attr_accessor :name_company

  def name_company
    if @name_company.nil?
      puts "У этот обьект никто не произвел"
    else
      puts "Производитель этого обьекта #{@name_company}"
    end
  end

end
