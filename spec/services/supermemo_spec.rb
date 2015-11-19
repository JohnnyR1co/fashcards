describe Supermemo do
  let!(:deck) { create(:deck) }

  context "default options" do
    let(:card) { create(:card, ef: 2.5, deck: deck) }

    it "change check numbers" do
      Supermemo.new(card).manage("Тест")
      expect(card.check).to eq(1)
    end

    it "change repetition interval" do
      Supermemo.new(card).manage("Тест")
      expect(card.repetition_interval).to eq(1)
    end
  end

  context "check == 1" do
    let(:card) { create(:card, ef: 2.5, check: 1, deck: deck) }

    it "change repetition interval" do
      Supermemo.new(card).manage("Тест")
      expect(card.repetition_interval).to eq(6)
    end
  end

  context "give a whrong answer" do
    let(:card) { create(:card, ef: 2.5, check: 4, deck: deck) }

    it "change repetition interval" do
      Supermemo.new(card).manage("Яблоко")
      expect(card.repetition_interval).to eq(1)
    end

    it "change check numbers" do
      Supermemo.new(card).manage("Яблоко")
      expect(card.check).to eq(0)
    end
  end
end
