class SessionsController < ApplicationController

  def create
    user = User.find_by(name: username)
    unless user
      render :new, notice: "who are you?"
    elsif user.authenticate(password)
      session[:current_user] = user.id
      redirect_to root_path, notice: "you're in, go nuts"
    else
      render :new, notice: "fail"
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: "peace out"
  end

  private

    def login_params
      params.require(:user).permit(:name, :password)
    end

    def username
      login_params[:name]
    end

    def password
      login_params[:password]
    end
end
