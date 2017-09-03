module ChartsHelper

  def gender_stats(college, program)
    last_five = access_school_service(college, program)
    gender = Hash[last_five.group_by{|h| [h[:year], h[:gender]]}.map{|k,v| [k.join(": "), v.count] }]
    @gender_stats= gender.sort_by {|k| k}
  end

  def ethnicity_stats(college, program)
    last_five = access_school_service(college, program)
    ethnicity = Hash[last_five.group_by{|h| [h[:year], h[:ethnicity]]}.map{|k,v| [k.join(": "), v.count]}]
    @ethnicity_stats = ethnicity.sort_by {|k| k}
  end

  def age_stats(college, program)
    last_five = access_school_service(college, program)
    age = Hash[last_five.group_by{|h| [h[:year], h[:agedesc]]}.map{|k,v| [k.join(": "), v.count]}]
    @age_stats = age.sort_by{|k| k}
  end

  def access_school_service(college, program)
    school = SchoolService.new
    last_five = school.last_five(college, program)
  end
end