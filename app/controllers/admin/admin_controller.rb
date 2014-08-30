class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def authenticate_user!
    unless user_signed_in? && current_user.role == 'admin'
      redirect_to new_user_session_path, notice: 'Please sign in with your admin account'
    end
  end
end
