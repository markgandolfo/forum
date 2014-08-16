class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    unless user_signed_in? && current_user.admin?
      redirect_to new_user_session_path, notice: 'Please sign in with your admin account'
    end
  end
end
