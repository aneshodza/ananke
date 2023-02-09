# frozen_string_literal: true

class ApplicationController < ActionController::Base
  DEVISE_ATTRS = %i[first_name last_name pfp_url].freeze

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_auth_state, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'You are not authorized to do that'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: DEVISE_ATTRS)
    devise_parameter_sanitizer.permit(:account_update, keys: DEVISE_ATTRS)
  end

  def check_auth_state
    return if user_signed_in?

    session[:redirect_to] = request.fullpath
    redirect_to new_user_session_path, alert: 'You must be logged in to access this page'
  end
end
