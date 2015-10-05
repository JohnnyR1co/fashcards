require "rails_helper"

RSpec.describe Card, type: :model do
  context "#check_translation" do
    let(:card) do
      card = Card.new(original_text: "Test", translated_text: "Тест")
    end
    
    it "should correct verify compliance translations" do
      expect(card.check_translation("тЕсТ")).to eq(false)
    end

    it "should not pass incorrect translations" do
      expect(card.check_translation("Текст")).to eq(false)
    end
  end
end
