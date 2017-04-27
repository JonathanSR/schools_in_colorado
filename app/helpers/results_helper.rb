module ResultsHelper

  def schools
    School.find_ethnicity_program_graduates(params[:college], params[:program], params[:ethnicity], params[:year])
  end

  def ethnicity_graduates
    School.find_all_ethnicity_graduates(params[:college], params[:ethnicity], params[:year])
  end

  def selected_graduates
    School.find_queried_graduates_count(params[:college], params[:program], params[:ethnicity], params[:year])
  end

  def school
    schools
    school = schools.first
  end

  def program_graduates 
    School.find_all_graduates_of_program(params[:college], params[:program], params[:year])
  end

  def program_total
    selected_graduates
    program_graduates
    School.percentage_of_ethnicity_graduates_for_that_program
  end
    
  def institution_total
    ethnicity_graduates 
    selected_graduates
    School.percentage_of_ethnicity_graduates_of_program_against_all_programs_for_that_ethnicity
  end

  def program
    Program.find_by(cip2:params[:program]) 
  end

  def institution
    Institution.find_by(name:params[:college])
  end
end