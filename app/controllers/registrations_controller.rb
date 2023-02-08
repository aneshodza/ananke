class RegistrationsController < Devise::RegistrationsController
  before_action :register_enabled?, only: [:new, :create]

  private

  def register_enabled?
    redirect_to new_user_session_path, alert: 'Registration is disabled' unless ENV['REGISTERABLE'] == 'true'
  end
end
