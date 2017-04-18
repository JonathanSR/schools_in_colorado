require 'rails_helper'

describe "user searches for graduation information" do
  it "user gets graduation data" do

    visit '/search'

    fill_in :college, with: "Colorado State University"
    fill_in :program, with: "14"
    fill_in :ethnicity, with: "Hispanic" 
    fill_in :year, with: "2015" 
    
    click_button "Get Results"
 
    expect(current_path).to eq("/results")
    expect(page).to have_content("Results")
    expect(page).to have_content("Colorado State University")
    expect(page).to have_content("Hispanic")
    expect(page).to have_content("2015")
  end
end