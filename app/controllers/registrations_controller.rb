class RegistrationsController < Devise::RegistrationsController
  before_action :register_enabled?, only: [:new, :create]
  prepend_before_action :require_no_authentication, only: [:cancel]

  private

  def register_enabled?
    return if ENV['REGISTERABLE'] == 'true' || user_signed_in?

    redirect_to new_user_session_path, alert: 'Registration is disabled'
  end

  def sign_up(resource_name, resource)
    super(resource_name, resource) if ENV['REGISTERABLE'] == 'true'
    true
  end

  def after_sign_up_path_for(resource)
    unless current_user == resource
      flash[:notice] = 'Successfully created a user!'
      users_path
    else
      flash[:notice] = 'Successfully signed up!'
      root_path
    end
  end
end
