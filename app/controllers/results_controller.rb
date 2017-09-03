class ResultsController <ApplicationController
  before_action :authorize!
  include ResultsHelper

  def index
    gon.institution = Institution.find_by(name:params[:college])
    @college = Institution.find_by(name:params[:college])
  end
end 

 