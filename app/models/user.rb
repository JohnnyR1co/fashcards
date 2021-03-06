class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :cards, dependent: :destroy
  has_many :decks, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  validates :password, length: { minimum: 3 }, if: :new_user?
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: :new_user?
  validates :email, uniqueness: true

  def self.send_welcome(user)
    NotificationMailer.welcome_email(user).deliver_now
  end

  private

    def new_user?
      new_record?
    end
end
