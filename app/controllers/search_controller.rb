class SearchController < ApplicationController

  def index
    @schools = School.find_graduates(params[:college], params[:degree], params[:ethnicity], params[:year])
  end
end