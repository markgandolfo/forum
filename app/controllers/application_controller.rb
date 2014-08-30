class ApplicationController < ActionController::Base
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

  # Required for cancan abilities
  def namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_name_segments.join('/').camelize
  end

  def current_ability
    Ability.new(current_user, namespace)
  end

  rescue_from CanCan::AccessDenied do |exception|
    abort("#{current_user.role} - #{exception.message}")
  end
end
