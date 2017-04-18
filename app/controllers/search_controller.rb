class SearchController < ApplicationController

  def show
    @programs = Program.all
    @institutions =Institution.all_institutions
    @ethnicities = Ethnicity.all_ethnicities
    @years = Year.all
  end
end
