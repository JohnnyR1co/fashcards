class NotificationMailer < ApplicationMailer
  default from: "jrico@rubydev.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome Email")
  end

  def pending_cards(card)
    @card = card
    mail(to: @card.user.email, subject: "Pending cards")
  end
end
