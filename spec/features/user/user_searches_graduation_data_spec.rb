require 'rails_helper'

describe "user searches for graduation information" do
  it "user gets graduation data" do

    visit '/'

    fill_in :college, with: "Colorado State University"
    fill_in :degree, with: "14"
    fill_in :ethnicity, with: "Hispanic" 
    fill_in :year, with: "2015" 
    
    click_button "Get Data"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Results")
    expect(page).to have_content("Colorado State University")
    expect(page).to have_content("Hispanic")
    expect(page).to have_content("2015")
  end
end