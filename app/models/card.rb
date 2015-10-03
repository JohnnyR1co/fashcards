class Card < ActiveRecord::Base
  before_save { self.original_text = original_text.capitalize }
  before_save { self.review_date += 3.days }
  validates :original_text, :translated_text, :review_date, presence: { message: "Can't be blank" }
  validates :original_text, uniqueness: { case_sensitive: false }
  scope :random, -> { where("review_date > ?", Date.today) }
  validate :translate

  def translate
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, "can't be the same")
    end
  end
end
