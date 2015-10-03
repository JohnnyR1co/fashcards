require "rails_helper"

RSpec.describe Card, type: :model do
  describe "check" do
    it "check original and translated text" do
      card = Card.new(original_text: "Apple", translated_text: "яблоко")
      expect(card.translate).to be nil
    end
  end
end
