class ResultsController <ApplicationController
  before_action :authorize!
  include ResultsHelper

  def index
    gon.institution = Institution.find_by(name:params[:college])
    @college = Institution.find_by(name:params[:college])
    five = FiveYear.five_year_data(params[:college],params[:program])
    # @last_five = five.collect{|i| [i.year, i.gender]}

    school = SchoolService.new
    last_five = school.last_five(params[:college], params[:program])
    gender = Hash[last_five.group_by{|h| [h[:year], h[:gender]]}.map{|k,v| [k.join(" - "), v.count] }]

    ethnicity = Hash[last_five.group_by{|h| [h[:year], h[:ethnicity]]}.map{|k,v| [k.join(" - "), v.count]}]

    @gender_stats= gender.sort_by {|k| k}
    @ethnicity_stats = ethnicity.sort_by {|k| k}
    #  byebug
  end
end 

 