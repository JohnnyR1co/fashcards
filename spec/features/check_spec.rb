require "rails_helper"

describe "Checking card" do

  let(:card) { create(:card) }

  it "redirects card to random when your translate is true" do
      visit random_path(card)     
      if card.check_translation("Тест")
      card.date_up
    end
      click_button "Check"
      expect(page).to have_content "13/10/2015"
    end
end


 