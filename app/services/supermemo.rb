class Supermemo
  def initialize(card)
    @card = card
  end

  def manage(your_translate)
    calculate_quality(your_translate)
    if @card.levenshtein(your_translate)
      if @card.check == 0
        @card.repetition_interval = 1
      elsif @card.check == 1
        @card.repetition_interval = 6
      else
        calculate_efactor
        interval
      end
      @card.check += 1
    else
      @card.check = 0
      @card.ef = 2.5
      @card.repetition_interval = 1
    end
    @card.review_date += @card.repetition_interval
    @card.save!
  end

  private

  def calculate_quality(your_translate)
    rating = (0..5).to_a.reverse
    @card.quality = rating[DamerauLevenshtein.distance(@card.translated_text, your_translate)]
  end

  def calculate_efactor
    @card.ef += (0.1 - (5 - @card.quality) * (0.08 + (5 - @card.quality) * 0.02))
  end

  def interval
    @card.repetition_interval = (@card.repetition_interval * @card.ef).to_i
  end
end
