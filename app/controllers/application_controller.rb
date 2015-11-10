class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = if current_user
      current_user.try(:locale)
    elsif
      params[:locale]
    else
      http_accept_language.compatible_language_from(I18n.available_locales)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end
end
