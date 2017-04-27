 require 'rails_helper'

describe Institution do 
 context "gets all schools" do
    it "returns an array of school objects" do
      schools = Institution.find_schools
      school = schools[0]

      expect(schools.class).to eq(Array)
      expect(school.name).to be_truthy
    end
  end

  it 'returns unique insitution names' do
    schools = Institution.all_institutions
    school = schools[0]
    byebug
    expect(schools.count).to eq(28)
    expect(school.name).to eq("Aims Community College")
    
  end
end