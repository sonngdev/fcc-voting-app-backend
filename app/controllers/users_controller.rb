class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    login_info = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created }.merge(login_info)
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
