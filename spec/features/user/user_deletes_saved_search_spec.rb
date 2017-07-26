require 'rails_helper'

  describe "user visits profile page" do

    before(:each) do
      mock_auth_hash
      visit root_path 
      click_link "Sign in with Google"
    end

    context "it clicks delete button" do
      it "removes saved record from page" do
        save_one  = User.first.saves.create(school:"CSU", ethnicity:"hispanic", year:"2016", program:"chem", program_grads:"23", ethnicity_grads:"10",percentage_one:".2", percentage_two:".5")
        click_link "Jonathan Serrano"

        expect(page).to have_content("CSU")
        expect(page).to have_content("hispanic")
        expect(page).to have_content("2016")

        click_on("Remove Search")
        expect(page).to_not have_content("CSU")
        expect(page).to_not have_content("hispanic")
        expect(page).to_not have_content("2016")
      end 
    end
  end
