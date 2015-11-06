class NotificationMailer < ApplicationMailer
  default from: "postmaster@sandbox6915f90dd89f4d80a22905f79669452e.mailgun.org"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome Email")
  end

  def pending_cards(email)
    @email = email
    mail(to: @email, subject: "Pending cards")
  end
end
