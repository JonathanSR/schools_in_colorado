class ResultsController <ApplicationController

  def index
    @schools = School.find_ethnicity_program_graduates(params[:college], params[:program], params[:ethnicity], params[:year])
    @school = @schools.first
    
    School.find_all_ethnicity_graduates(params[:college], params[:ethnicity], params[:year])
    @selected_graduates = School.find_queried_graduates_count(params[:college], params[:program], params[:ethnicity], params[:year])
    @program_graduates = School.find_all_graduates_of_program(params[:college], params[:program], params[:year])
    
    @program_total = School.percentage_of_ethnicity_graduates_for_that_program
    @institution_total = School.percentage_of_ethnicity_graduates_of_program_against_all_programs_for_that_ethnicity
 
    @program =Program.find_by(cip2:params[:program])
  end

end