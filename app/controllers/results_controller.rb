class ResultsController <ApplicationController
  before_action :authorize!
  include ResultsHelper

  def index
    gon.institution = Institution.find_by(name:params[:college])
    @college = Institution.find_by(name:params[:college])
  end

  def graduations
    byebug
    render json: ethnicity_graduates
  end
end 

