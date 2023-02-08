class SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(resource)
    session[:redirect_to] || super
  end
end
