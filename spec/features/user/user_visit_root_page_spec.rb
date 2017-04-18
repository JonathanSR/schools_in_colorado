require 'rails_helper'

  xdescribe "when user visits root" do
    it "they see links to different services" do

      visit '/'

      expect(page).to have_content("Higher Ed Stats")
      expect(page).to have_link("View All Colorado Colleges")
      expect(page).to have_link("View Scholarships")
      expect(page).to have_link("Sign in with Google")
    end
  end