#require "spec-helper"
require "card"

RSpec.describe Card do
  describe 'check' do
    it 'check original and translated text' do
      expect(Card.new.translate("Apple", "Apple")).to be false
    end
  end
end