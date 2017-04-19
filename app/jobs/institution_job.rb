class InstitutionJob < ActiveJob::Base
  queue_as :urgent

  def perform
    raw_information = SchoolService.get_data
    raw_information.map do |school|
      Institution.new(school)
    end
  end
end
