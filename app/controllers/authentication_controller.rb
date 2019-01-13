class AuthenticationController < ApplicationController
  def authenticate
    login_info =
      AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    json_response(login_info)
  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
