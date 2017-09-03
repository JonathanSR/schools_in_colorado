class ChartsController < ApplicationController
  def index
    school = SchoolService.new
    last_five = school.last_five(params[:college], params[:program])
    gender = Hash[last_five.group_by{|h| [h[:year], h[:gender]]}.map{|k,v| [k.join(": "), v.count] }]

    ethnicity = Hash[last_five.group_by{|h| [h[:year], h[:ethnicity]]}.map{|k,v| [k.join(": "), v.count]}]
    age = Hash[last_five.group_by{|h| [h[:year], h[:agedesc]]}.map{|k,v| [k.join(": "), v.count]}]

    @gender_stats= gender.sort_by {|k| k}
    @ethnicity_stats = ethnicity.sort_by {|k| k}
    @age_stats = age.sort_by{|k| k}
    #  byebug

  end

end