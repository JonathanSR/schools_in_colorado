require 'rails_helper'

xdescribe "user searches for graduation information" do
  it "user gets graduation data" do

    visit '/search'

    select "2015", from: "year"
    select "14", from: "program"
    select "Colorado State University", from: "college"
    select "Hispanic", from: "ethnicity"
     
    click_button "Get Results"
 
    expect(current_path).to eq("/results")
    expect(page).to have_content("Results")
    expect(page).to have_content("Colorado State University")
    expect(page).to have_content("Hispanic")
    expect(page).to have_content("2015")
  end
end