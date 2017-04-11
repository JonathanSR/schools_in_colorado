require 'rails_helper'

describe "user visits root page" do
 it "user fills out demographic box" do

    visit '/'

    fill_in :college, with: "Colorado State University"
    fill_in :degree, with: "14"
    fill_in :ethnicity, with: "Hispanic" 
    fill_in :year, with: "2015" 
    
    click_button "Get Data"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Colorado State University")
  end
end