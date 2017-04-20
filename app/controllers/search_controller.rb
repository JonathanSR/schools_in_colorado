class SearchController < ApplicationController
before_action :authorize!
caches_action :show

  def show
    @programs = Program.all
    @institutions =Institution.all_institutions
    @ethnicities = Ethnicity.all_ethnicities
    @years = Year.all
  end
end
