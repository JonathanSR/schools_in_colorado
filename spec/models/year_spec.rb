require 'rails_helper'

xdescribe "Year" do
  context "gets all years" do
    it "returns an array of year objects" do
      years = Year.get_years
      year = years[0]

      expect(years.class).to eq(Array)
      expect(year.year).to be_truthy
    end
  end

  it "returns unique years" do
    years = Year.all_years
    year = years[0]
byebug
    expect(years.count).to eq(11)
    expect(year.year).to eq(2001)
  end
end