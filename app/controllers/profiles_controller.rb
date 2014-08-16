class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = User.find(params[:id])
  end
end