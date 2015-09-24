class Card < ActiveRecord::Base
  before_save { self.original_text = original_text.capitalize }
  validates :original_text, :translated_text, :review_date, presence: { message: "Can't be blank" }
  validates :original_text, uniqueness: { case_sensitive: false }
  validate :translate

  def translate
    if original_text == translated_text
      errors.add(:translated_text, "can't be the same")
    end
  end
end
