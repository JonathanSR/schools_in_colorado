require 'rails_helper'

describe SchoolService do
  context "find by params" do
    it "returns an array of hashes with school info" do
      #service = SchoolService.new
      schools = SchoolService.find_graduates("Colorado State University", "14", "Hispanic", "2015")
      #byebug
      school = schools[0]

      expect(schools.class).to eq(Array)
      expect(school[:institutionname]).to be_truthy
      expect(school[:cip2]).to be_truthy
      expect(school[:ethnicity]).to be_truthy
      expect(school[:year]).to be_truthy
    end
  end
end