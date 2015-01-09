class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def me?
    user = User.find_by(id: session[:current_user])
    user && user.name == 'katie'
  end
  helper_method :me?

  def authorize(redirect_path)
    redirect_to redirect_path, notice: 'authorization fail' unless me?
  end
  helper_method :authorize  
end
