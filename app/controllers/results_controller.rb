class ResultsController <ApplicationController

  def index
    @schools = School.find_ethnicity_program_graduates(params[:college], params[:degree], params[:ethnicity], params[:year])
    @school = @schools.first
    
    @ethnicity_graduates = School.find_all_ethnicity_graduates(params[:college], params[:ethnicity], params[:year])
    @ethnicity_graduates_of_program = School.find_queried_graduates_count(params[:college], params[:degree], params[:ethnicity], params[:year])
    
    @all_graduates = School.find_all_graduates_of_program(params[:college], params[:degree], params[:year])

    @total = @ethnicity_graduates_of_program.to_f / @ethnicity_graduates
    @total = '%.3f' % @total

    @second_total = @ethnicity_graduates_of_program.to_f / @all_graduates
    @second_total = '%.3f' % @second_total
  end

end