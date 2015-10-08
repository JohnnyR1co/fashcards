require "rails_helper"

  context "#check_translation" do
    let(:card) { create(:card) }
    
    it "should correct verify compliance translations" do
      expect(card.check_translation("тЕсТ")).to eq(false)
    end

    it "should not pass incorrect translations" do
      expect(card.check_translation("Текст")).to eq(false)
    end
  end
