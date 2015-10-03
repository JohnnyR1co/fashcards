class Card
  attr_accessor :original_text, :translated_text

  def translate(original_text, translated_text)
    original_text == translated_text
  end
end