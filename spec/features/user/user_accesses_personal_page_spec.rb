require 'rails_helper'

  describe "user visits root page" do
    context "it clicks profile button" do
      it "is taken to profile page" do
        mock_auth_hash
        visit root_path 
        click_link "Sign in with Google"
        save_one  = User.first.saves.create(school:"CSU", ethnicity:"hispanic", year:"2016", program:"chem", program_grads:"23", ethnicity_grads:"10",percentage_one:".2", percentage_two:".5")

        expect(page).to have_link("Jonathan Serrano")
        click_link "Jonathan Serrano"

        expect(page).to have_content("Jonathan Serrano")
        expect(page).to have_content("Saved Searches")
        expect(page).to have_content("Saved Schools")
        expect(page).to have_content("CSU")
        expect(page).to have_content("hispanic")
      end
    
  def mock_auth_hash
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "1234",
        info: {
          name: "Jonathan Serrano",
        },
        credentials: {
          token: "1234djdjd",
          expires_at: DateTime.now,
        }
    })
    end
  end
end

#   def current_user_hash
#     auth = {
#       provider: "google",
#       uid: "1234",
#       info: {
#         name: "Jonathan Serrano",
#       },
#       credentials: {
#         token: "abcdefg12345",
#         expires_at: DateTime.now
#       }
#     }
#     User.create(auth)
#     current_user = User.first
#   end
# end
# end