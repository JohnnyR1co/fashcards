class UserMailer < ApplicationMailer
  default from: "jrico@rubydev.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Sample Email")
  end
end
