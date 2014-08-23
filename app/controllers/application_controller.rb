class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit( :email, :password, :password_confirmation,
        :username, :title, :homepage, :dob, :signature, :referrer,
        :post_count, :biography, :location, :sex, :occupation, :ride, :marketing,
        :third_party_opt_in, :timezone)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit( :email, :password, :password_confirmation,
        :username, :title, :homepage, :dob, :signature, :referrer,
        :post_count, :biography, :location, :sex, :occupation, :ride, :marketing,
        :third_party_opt_in, :timezone)
    end
  end
end
