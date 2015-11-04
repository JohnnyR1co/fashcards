class CardsMailer < ApplicationMailer
  default from: "jrico@rubydev.com"

  def pending_cards(card)
    @card = card
    mail(to: @card.user.email, subject: "Welcome Email")
    end
  end
end
