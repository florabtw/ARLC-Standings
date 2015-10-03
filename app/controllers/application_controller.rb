class ApplicationController < ActionController::Base
  require 'bcrypt'
  include BCrypt

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    # USER_ID and PASSWORD_HASH are included as initializers (hidden from git)
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        hash_pass = Password.new(PASSWORD_HASH)
        user_match = username == USER_ID
        password_match = hash_pass == password

        user_match && password_match
      end
    end
end
