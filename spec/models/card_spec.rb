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

    it "expect your date review date increse" do
      card.date_change("Тест")
      expect(card.review_date).to eq("04.10.2016".to_date)
    end

    it "expect your date review date decrese" do
      card.date_change("Тескт")
      expect(card.review_date).to eq("28.09.2016".to_date)
    end
  end
