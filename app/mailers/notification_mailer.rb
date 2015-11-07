class NotificationMailer < ApplicationMailer
  default from: "jrico@rubydev.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome Email")
  end

  def pending_cards(email)
    @email = email
    mail(to: "#{email}!", subject: "Pending cards")
  end
end
