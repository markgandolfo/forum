class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private
end