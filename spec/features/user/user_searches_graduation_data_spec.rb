require 'rails_helper'

xdescribe "user searches for graduation information", :type => :feature, :js => true do
  it "user gets graduation data" do
    VCR.use_cassette('/user/user_searches') do
    mock_auth_hash

    visit root_path
    click_link "Sign in with Google"
    select "2015", from: "year"
    select "Engineering", from: "program"
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