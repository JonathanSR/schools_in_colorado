require 'rails_helper'

  describe "when user visits root" do
    it "they see a search box pertaining to graduation information" do

      visit '/'

      expect(page).to have_content("Colorado Graduation Rates")
    end
  end