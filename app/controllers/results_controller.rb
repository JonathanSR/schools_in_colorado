class ResultsController <ApplicationController
  before_action :authorize!
  caches_action :show  
  include ResultsHelper

  def index
  end
end 