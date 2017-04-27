class Institution < ApplicationRecord
#attr_reader :name
geocoded_by :name
after_validation :geocode, if: ->(obj){obj.name.present? and obj.name_changed? }



  # def initialize(school)
  #   @name = school[:institutionname]
  # end

  # def self.find_schools
  #     raw_information = school_service.get_data
  #     raw_information.map do |school|
  #       Institution.new(school)
  #   end
  # end

  # def self.all_institutions
  #     @schools = self.find_schools
  #     all_institutions = @schools.uniq {|s| s.name}
  # end

  # def self.school_service
  #   SchoolService.new
  # end

end
