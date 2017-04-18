require 'rails_helper'

describe "user visits root page" do
 it "user fills out demographic box" do

    visit '/search'

    fill_in :year, with: "2015" 
    select "Colorado State University", from: "college"
    select "Hispanic", from: "ethnicity"
    select "14", from: "program"
    click_button "Get Results"

    expect(current_path).to eq("/results")
    expect(page).to have_content("Colorado State University")
  end
end