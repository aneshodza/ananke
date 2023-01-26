# frozen_string_literal: true

class ApplicationController < ActionController::Base
  DEVISE_ATTRS = %i[first_name last_name pfp_url].freeze

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: DEVISE_ATTRS)
    devise_parameter_sanitizer.permit(:account_update, keys: DEVISE_ATTRS)
  end
end
