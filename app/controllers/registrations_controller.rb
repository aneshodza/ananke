class RegistrationsController < Devise::RegistrationsController
  before_action :registerable?, only: [:new, :create]
  prepend_before_action :require_no_authentication, only: [:cancel]

  private

  def registerable?
    return if ENV['REGISTERABLE'] == 'true' || (current_user && current_user.admin?)

    flash[:alert] = 'You are not authorized to do that'
    return redirect_to users_path if current_user

    flash[:alert] = 'Registration is disabled'
    redirect_to new_user_session_path
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
