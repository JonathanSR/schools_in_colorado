require 'rails_helper'
 
  describe "user logs in" do

    before(:each) do
      mock_auth_hash
    end

    scenario "using google oauth2" do
      visit root_path

      expect(page).to have_link("Sign in with Google")

      click_link "Sign in with Google"

      expect(page).to have_content("Jonathan Serrano")
      expect(page).to have_link("Sign out")
    end
  end