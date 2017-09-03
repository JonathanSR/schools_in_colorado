require 'rails_helper'

describe FiveYear do
    describe "set year search" do
      it "returns an array of fiveyear objects" do
        VCR.use_cassette('/models/five_year') do
        five_year_data = FiveYear.five_year_data("Colorado State University", "14")
        single_record = five_year_data[0]

        expect(five_year_data.class).to eq(Array)
        expect(single_record.class).to eq(FiveYear)
        
        expect(five_year_data.count).to eq(824)
        expect(single_record.program).to eq("Bioengineering and Biomedical Engineering.")
        expect(single_record.year).to eq("2016")
        expect(single_record.ethnicity).to eq("Asian")
        expect(single_record.gender).to eq("Female")
      end
    end
  end
end
