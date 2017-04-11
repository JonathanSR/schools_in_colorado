class School
attr_reader :college,
            :degree,
            :ethnicity,
            :year

  def initialize(graduate_information)
    @college = graduate_information[:institutionname]
    @degree = graduate_information[:cip2]
    @ethnicity = graduate_information[:ethnicity]
    @year = graduate_information[:year]
  end

  def self.find_graduates(college, program, ethnicity, year)
    raw_information = SchoolService.find_graduates(college, program, ethnicity, year)
    raw_information.map do |graduate_information|
      School.new(graduate_information)
    end
  end

  
end