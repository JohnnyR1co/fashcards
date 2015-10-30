class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  validates :original_text, :translated_text, :review_date, :deck_id,
            presence: true
  validates :original_text, uniqueness: { scope: :user_id }
  scope :random, -> { where("review_date >= ?", Date.today) }
  validate :translate
  mount_uploader :card_picture, CardPictureUploader

  def check_translation(your_translate)
    self.translated_text == your_translate
  end

  def date_up
    case check_count
    when 0 then self.review_date += 12.hours
    when 1 then self.review_date += 3.days
    when 2 then self.review_date += 7.days
    when 3 then self.review_date += 14.days
    when 4 then self.review_date += 1.month
    end
    if check_count < 4
      self.check_count += 1
    end
    self.save!
  end

  def date_down
    case check_count
    when 0 then self.review_date -= 12.hours
    when 1 then self.review_date -= 3.days
    when 2 then self.review_date -= 7.days
    when 3 then self.review_date -= 14.days
    when 4 then self.review_date -= 1.month
    end
    if check_count > 0
      self.check_count -= 1
    end
    self.save!
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
