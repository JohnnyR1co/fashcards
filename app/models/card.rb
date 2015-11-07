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

  def handle_check(your_translate)
    time = [12.hours, 3.days, 7.days, 14.days, 1.month]
    if check_translation(your_translate)
      self.review_date += time[check_count]
      self.check_count += 1 if check_count < 4
    else
      self.review_date -= time[check_count]
      self.check_count -= 1 if check_count > 0
    end
    self.save!
  end

  def self.notify_cards
    Card.where("review_date <= ?", Date.today).each do |card|
      NotificationMailer.pending_cards(card.user.email).deliver_now
    end
  end

  def check_mistakes(your_translate)
    DamerauLevenshtein.distance(translated_text, your_translate, 2) < 4
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
