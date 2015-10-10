require "rails_helper"

describe "Checking card" do

  let(:user) { create(:user) }
  let(:card) { create(:card) }

  it "redirects card to random when your translate is true" do
    visit random_path(card)     
    fill_in "your_translate", with: "Тест"
    click_button "Check"
    expect(page).to have_content "true"
  end
end
