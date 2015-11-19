class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :original_text, :translated_text, :review_date, :deck_id,
            presence: true
  validates :original_text, uniqueness: { scope: :user_id }
  scope :random, -> { where("review_date <= ?", Date.today) }
  validate :translate
  mount_uploader :card_picture, CardPictureUploader

  def check_translation(your_translate)
    translated_text == your_translate
  end

  def self.notify_cards
    Card.where("review_date <= ?", Date.today).each do |card|
      NotificationMailer.pending_cards(card.user.email).deliver_now
    end
  end

  def levenshtein(your_translate)
    DamerauLevenshtein.distance(translated_text, your_translate) < 3
  end

  def self.search(search)
    where(:deck_id == search)
  end

  def translate
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, "can't be the same")
    end
  end
end
