class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :tokenized
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    attributes = %i[name bio]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  def tokenized
    puts  'TEST1'
    return nil unless params[:authentication_token]
    puts  'TEST2'
    user = User.find_by_authentication_token(params[:authentication_token])
    puts  'TEST3'
    sign_in(user)
    puts  'TEST4'
  end
end
