require 'rails_helper'
 
  describe "user logs in" do
    scenario "using google oauth2" do
      mock_auth_hash
      visit root_path

      expect(page).to have_link("Sign in with Google")

      click_link "Sign in with Google"

      expect(page).to have_content("Jonathan Serrano")
      expect(page).to have_link("Sign out")
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