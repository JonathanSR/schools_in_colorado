require 'rails_helper'

describe School do
  context "find by search" do
    it "returns an array of school objects" do

      schools = School.find_graduates("Colorado State University", "14", "Hispanic", "2015")
      school = schools[0]

      expect(schools.class).to eq(Array)
      expect(school.college).to be_truthy
      expect(school.degree).to be_truthy
      expect(school.ethnicity).to be_truthy
      expect(school.year).to be_truthy
    end
  end
end      