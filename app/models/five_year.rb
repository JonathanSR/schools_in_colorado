class FiveYear
attr_reader :program,
            :year,
            :ethnicity,
            :gender


  def initialize(grad_info)
    @program = grad_info[:programname]
    @year = grad_info[:year]
    @ethnicity = grad_info[:ethnicity]
    @gender = grad_info[:gender]
  end


  def self.five_year_data(college, program)
    data = service.last_five(college, program)
    data.map do |grad_info|
      FiveYear.new(grad_info)
    end
  end

  def self.service
    SchoolService.new
  end
end