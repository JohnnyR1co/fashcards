require "rails_helper"
require "login_helper"

describe "Checking card" do  
  let!(:user) { create(:user) }

  before(:each) do
    login("ruby@rails.rb", "password")
  end

  it "it expect you logged out" do
    visit root_path
    click_link "Logout"
    expect(page).to have_content "Logged out!"
  end
end
