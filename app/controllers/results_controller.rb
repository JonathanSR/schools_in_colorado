class ResultsController <ApplicationController
  before_action :authorize!
  caches_action :show
  include ResultsHelper

  def index
    gon.institution = Institution.find_by(name:params[:college])
  end
end 