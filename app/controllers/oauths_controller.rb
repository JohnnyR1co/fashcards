class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
      rescue
        flash.now[:alert] = "Failed to login from #{provider.titleize}!"
        redirect_to root_path
      end
    end
  end

  private
  
   def auth_params
     params.permit(:code, :provider)
   end
end