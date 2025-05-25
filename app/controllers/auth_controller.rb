class AuthController < ApplicationController
  def login
    # This will be handled by Auth0
  end

  def callback
    auth = request.env['omniauth.auth']
    # Handle the authentication callback
    session[:userinfo] = auth['info']
    redirect_to dashboard_path
  end

  def failure
    @error_msg = request.params['message']
  end
end 