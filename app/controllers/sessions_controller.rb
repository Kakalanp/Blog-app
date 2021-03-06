class SessionsController < Devise::SessionsController
  def create
    email = params[:user][:email]
    password = params[:user][:password]
    if email == '' || password == '' || User.find_by_email(email).nil?
      redirect_to new_user_session_path, alert: 'Invalid email or password'
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      if session[:return_to].blank?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        redirect_to session[:return_to]
        session[:return_to] = nil
      end
    end
  end
end
