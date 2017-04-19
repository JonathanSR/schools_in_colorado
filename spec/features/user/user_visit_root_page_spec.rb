require 'rails_helper'

  describe "when user visits root" do
    it "they see name of app" do
      visit '/'

      expect(page).to have_content("Stats For College")
      expect(page).to have_content("Sign in with Google")
    end
  end