require 'rails_helper'

describe "user searches for graduation information", :type => :feature, :js => true do

  before(:each) do
    mock_auth_hash
    visit root_path
    Year.create(date_year: '2015')
    click_link "Sign in with Google"
  end

  it "user gets graduation data" do
    # VCR.use_cassette('/user/user_searches') do


    # byebug
    select "2015", from: "year"
    wait_for_ajax
    select "Colorado State University", from: "college"
    # byebug
    wait_for_ajax
    select "Engineering", from: "program"
    select "Hispanic", from: "ethnicity"
    click_button "Get Results"
  
    expect(current_path).to eq("/results")
    expect(page).to have_content("Results")
    expect(page).to have_content("Colorado State University")
    expect(page).to have_content("Hispanic")
    expect(page).to have_content("2015")
    end
  # end
end