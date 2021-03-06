require "rails_helper"

  context "#check_translation" do
    let!(:deck) { create(:deck) }
    let(:card) { create(:card, deck: deck) }

    it "should correct verify compliance translations" do
      expect(card.check_translation("тЕсТ")).to eq(false)
    end

    it "should not pass incorrect translations" do
      expect(card.check_translation("Текст")).to eq(false)
    end

    it "expect you have a notice when you make a mistake" do
      expect(card.levenshtein("тЕст")).to eq(true)
    end
  end
