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
      card.handle_check("Тест")
      expect(card.review_date).to eq("04.10.2015".to_date)
    end

    it "expect your date review date decrese" do
      card.handle_check("Тескт")
      expect(card.review_date).to eq("28.09.2015".to_date)
    end

    it "expect you have a notice when you make a mistake" do
      expect(card.check_mistakes("тЕсТ")).to eq(true)
    end
  end
