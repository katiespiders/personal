class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def me?
    user = User.find_by(id: session[:current_user])
    user && user.name == 'katie'
  end
  helper_method :me?
  
end
