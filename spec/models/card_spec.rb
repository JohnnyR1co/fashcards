require "rails_helper"

RSpec.describe Card, type: :model do
  describe "check" do
    it "check original and translated text" do
      card = Card.new(original_text: "Apple", translated_text: "Apple")
      expect(card.translate).to eq(["can't be the same"])
    end
  end
end
