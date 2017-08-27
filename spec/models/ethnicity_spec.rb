require 'rails_helper'

  describe Ethnicity do
    context "gets all ethnicities" do
      it "returns an array of ethnicity objects" do
        ethnicities = Ethnicity.get_ethnicities
        ethnicity = ethnicities[0]

        expect(ethnicities.class).to eq(Array)
        expect(ethnicity.class).to eq(Ethnicity)
        expect(ethnicity.ethnicity).to eq("White, non-Hispanic")
      end
    end

  it 'returns unique ethnicity types' do
    ethnicities = Ethnicity.all_ethnicities
    ethnicity = ethnicities[0]

    expect(ethnicities.count).to eq(11)
    expect(ethnicity.class).to eq(Ethnicity)
    expect(ethnicity.ethnicity).to eq("White, non-Hispanic")
  end
end