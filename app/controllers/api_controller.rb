require 'application_responder'
#
class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  self.responder = ApplicationResponder
  before_filter :authenticate_token!
  include ActionController::MimeResponds
  respond_to :json

  private

  def authenticate_token!
    authenticate_or_request_with_http_token do |token, _options|
      @api_user = User.find_by(api_token: token)
    end
  end
end
