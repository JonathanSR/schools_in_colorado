class Institution

attr_reader :name
            :all_institutions

  def initialize(school)
    @name = school[:institutionname]
  end

  def self.find_schools
    raw_information = SchoolService.get_data
    raw_information.map do |school|
      Institution.new(school)
    end
  end

  def self.all_institutions
    @schools = self.find_schools
    @all_institutions = @schools.uniq {|s| s.name}
  end

end
