class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      User.send_welcome(@user)
      auto_login(@user)
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: "The user has been updated"
    else
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :locale)
    end
end
