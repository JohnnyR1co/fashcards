require "rails_helper"
require "login_helper"

describe "Checking card" do  
  let!(:user) { create(:user) }
  let!(:deck) { create(:deck) }

  before(:each) do
    login("ruby@rails.rb", "password")
  end

  let!(:card) { create(:card, user: user, deck: deck) }

  it "redirects card to random when your translate is true" do
    visit root_path
    select("Fruits", from: "search")
    click_button("Show Random")
    fill_in "your_translate", with: "Тест"
    click_button "Check"
    expect(page).to have_content "You are true"
  end
end
