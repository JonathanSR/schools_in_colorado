class School
attr_reader :college,
            :program,
            :ethnicity,
            :year,
            :all_graduates_of_program,
            :ethnicity_graduates,
            :ethnicity_graduates_of_program

  def initialize(graduate_information)
    @college = graduate_information[:institutionname]
    @program = graduate_information[:cip2]
    @ethnicity = graduate_information[:ethnicity]
    @year = graduate_information[:year]
    byebug
  end

  def self.find_ethnicity_program_graduates(college, program, ethnicity, year)
    raw_information = school_service.find_ethnicity_program_graduates(college, program, ethnicity, year) 
    raw_information.map do |graduate_information|
      School.new(graduate_information)
    end
  end 

  def self.find_all_graduates_of_program(college, program, year)
    raw_information = school_service.find_all_graduates_of_program(college, program, year)
    @all_graduates_of_program = raw_information.count
  end

  def self.find_queried_graduates_count(college, program, ethnicity, year)
    raw_information = school_service.find_ethnicity_program_graduates(college, program, ethnicity, year)
    ethnicity_graduates = raw_information.count
    @ethnicity_graduates_of_program = ethnicity_graduates
  end

  def self.find_all_ethnicity_graduates(college, ethnicity, year)
    raw_information = school_service.find_all_ethnicity_graduates(college, ethnicity, year)
    @ethnicity_graduates = raw_information.count
  end

  def self.percentage_of_ethnicity_graduates_for_that_program
      total = @ethnicity_graduates_of_program.to_f /
              @all_graduates_of_program.to_f
      program_final = '%.3f' % total
  end 

  def self.percentage_of_ethnicity_graduates_of_program_against_all_programs_for_that_ethnicity
       total = @ethnicity_graduates_of_program.to_f  /
               @ethnicity_graduates.to_f
      institution_final = '%.3f' % total
  end

  def self.school_service
    @service = SchoolService.new
  end
end