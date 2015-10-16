require "rails_helper"

describe "Checking login_action" do
  let!(:user) { create(:user) }
  
  it "it expect you enter a right password" do
    visit root_path
    click_link "Login"
    fill_in :email, with: "ruby@rails.rb"
    fill_in :password, with: "password"
    click_button "Login"
    expect(page).to have_content "Login successful!"
  end

  it "it expect you enter a whrong password" do
    visit root_path
    click_link "Login"
    fill_in :email, with: "ruby@rails.rb"
    fill_in :password, with: "passwor"
    click_button "Login"
    expect(page).to have_content "Login failed"
  end
end
