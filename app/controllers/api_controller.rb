#
class ApiController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :authenticate_token!

  private

  def authenticate_token!
    authenticate_or_request_with_http_token do |token, _options|
      @api_user = User.find_by(api_token: token)
    end
  end
end
