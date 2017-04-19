class Ethnicity
attr_reader :ethnicity


  def initialize(data)
    @ethnicity = data[:ethnicity]
  end

  def self.get_ethnicities
    raw_information = school_service.get_data
    raw_information.map do |data|
      Ethnicity.new(data)
    end
  end

  def self.all_ethnicities
    @ethnicities = self.get_ethnicities
    all_ethnicities = @ethnicities.uniq {|s| s.ethnicity}
  end

  def self.school_service
    SchoolService.new
  end
end

