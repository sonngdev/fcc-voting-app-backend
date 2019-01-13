class AuthenticateUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    {
      auth_token: JsonWebToken.encode(user_id: user.id),
      user: { id: user.id, username: user.username }
    } if user
  end

  private

  attr_reader :username, :password

  def user
    user = User.find_by(username: username)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
