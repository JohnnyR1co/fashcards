class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :original_text, :translated_text, :review_date, :deck_id,
            presence: { message: "Can't be blank" }
  validates :original_text, uniqueness: { scope: :user_id }
  scope :random, -> { where("review_date <= ?", Date.today) }
  validate :translate
  mount_uploader :card_picture, CardPictureUploader

  def date_up
    self.review_date += 3.days
    self.save!
  end

  def self.search(search)
    where(:deck_id == search) 
  end

  def check_translation(your_translate)
    self.translated_text == your_translate
  end

  def translate
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, "can't be the same")
    end
  end
end
