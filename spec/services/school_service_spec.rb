require 'rails_helper'

describe SchoolService do
  attr_reader :service
 
  before(:each) do
    @service = SchoolService.new
  end


  describe "main search" do
    it "returns an array of hashes for the school, program, year, ethnicity queried" do
      VCR.use_cassette('/services/school_info') do
        graduates = @service.find_ethnicity_program_graduates("Colorado State University", "14", "Hispanic", "2015")
        graduate = graduates[0]

        expect(graduates.class).to eq(Array)
        expect(graduates.count).to eq(14)
        expect(graduate[:institutionname]).to be_truthy
        expect(graduate[:cip2]).to be_truthy
        expect(graduate[:ethnicity]).to be_truthy
        expect(graduate[:year]).to be_truthy
      end
    end
  end

  describe "graduates of program search" do
    it "returns all graduates for the school, program and year queried" do 
      VCR.use_cassette('/services/graduates_of_program') do      
        graduates = @service.find_all_graduates_of_program("Colorado State University", "14", "2015")
        graduate = graduates[0]
        
        expect(graduates.class).to eq(Array)
        expect(graduates.count).to eq(197)
        expect(graduate[:institutionname]).to be_truthy
        expect(graduate[:cip2]).to be_truthy
        expect(graduate[:year]).to be_truthy
      end
    end
  end

  describe "all graduates of ethnicity for institution search" do
    it "returns all graduates for that school and ethnicity queried" do
      VCR.use_cassette('/services/graduates_of_ethnicity_program') do      
        graduates = @service.find_all_ethnicity_graduates("Colorado State University", "Hispanic", "2015")

        graduate = graduates[0]
        expect(graduates.count).to eq(247)
        expect(graduate[:institutionname]).to be_truthy
        expect(graduate[:year]).to be_truthy
        expect(graduate[:ethnicity]).to be_truthy
      end
    end
  end

  describe "it returns all available data" do
    it "returns all available data" do
      VCR.use_cassette('/services/all_data') do      
        schools = @service.get_data
        school = schools[0]
        expect(school[:institutionname]).to be_truthy
      end
    end
  end
end