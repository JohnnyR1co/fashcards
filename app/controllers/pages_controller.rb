class PagesController < ApplicationController
  before_action :require_login, only: :start_check
  def welcome
  end

  def start_check
  end
end
