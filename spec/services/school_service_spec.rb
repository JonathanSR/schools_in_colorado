require 'rails_helper'

describe SchoolService do
  context "find by params" do
    it "returns an array of hashes with graduates queried info" do
      #service = SchoolService.new
      graduates = SchoolService.find__ethnicity_program_graduates("Colorado State University", "14", "Hispanic", "2015")
      #byebug
      graduate = graduates[0]

      expect(graduates.class).to eq(Array)
      expect(graduate[:institutionname]).to be_truthy
      expect(graduate[:cip2]).to be_truthy
      expect(graduate[:ethnicity]).to be_truthy
      expect(graduate[:year]).to be_truthy
    end
  end

  context "find all graduates" do
    it "returns all graduates for the school, program and year queried" do
      graduates = SchoolService.find_all_graduates_of_program("Colorado State University", "14", "2015")   
      graduate = graduates[0]
      
      expect(graduates.class).to eq(Array)
      expect(graduates.count).to eq(197)
      expect(graduate[:institutionname]).to be_truthy
      expect(graduate[:cip2]).to be_truthy
      expect(graduate[:year]).to be_truthy
    end
  end

  context "finds all ethnicity graduates" do
    it "returns all graduates for that school and ethnicity queried" do
      graduates = SchoolService.find_all_ethnicity_graduates("Colorado State University", "2015", "Hispanic")
   
      graduate = graduates[0]
      expect(graduates.count).to eq(247)
      expect(graduate[:institutionname]).to be_truthy
      expect(graduate[:year]).to be_truthy
      expect(graduate[:ethnicity]).to be_truthy
    end
  end
end