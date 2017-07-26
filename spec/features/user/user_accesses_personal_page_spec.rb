require 'rails_helper'

  describe "user visits root page" do
    
    before(:each) do 
      mock_auth_hash
      visit root_path
      click_link "Sign in with Google"
    end

    context "it clicks profile button" do
      it "is taken to profile page" do
        save_one  = User.first.saves.create(school:"CSU", ethnicity:"hispanic", year:"2016", program:"chem", program_grads:"23", ethnicity_grads:"10",percentage_one:".2", percentage_two:".5")

        expect(page).to have_link("Jonathan Serrano")
        click_link "Jonathan Serrano"

        expect(page).to have_content("Jonathan Serrano")
        expect(page).to have_content("Saved Searches")
        expect(page).to have_content("Saved Schools")
        expect(page).to have_content("CSU")
        expect(page).to have_content("hispanic")
      end
    end
  end
