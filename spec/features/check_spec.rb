require "rails_helper"
require "login_helper"

describe "Checking card" do  
  let!(:user) { create(:user) }

before(:each) do
  login("ruby@rails.rb", "password")
end

  let!(:card) { create(:card, user: user) }

  it "redirects card to random when your translate is true" do
    visit random_path(card)
    fill_in "your_translate", with: "Тест"
    click_button "Check"
    expect(page).to have_content "You are true"
  end
end
