class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_id])
  end
  # def basic_auth
  #   authenticate_or_request_with_http_with_http_basic do |username, password|
  #     username == 'shimpei' && password == '1218'
  #   end
  # end
end