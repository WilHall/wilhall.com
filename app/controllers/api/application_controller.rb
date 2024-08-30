class Api::ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  skip_before_action :verify_authenticity_token
  before_action :authenticate

  private

  def authenticate
    authenticate_user_with_token || authentication_failure
  end

  def authenticate_user_with_token
    authenticate_with_http_token do |token, options|
      @client = Client.where(active: true).find_by(api_key: token)
    end
  end

  def authentication_failure
    render json: { error: "Not Authorized" }, status: :unauthorized
  end
end
