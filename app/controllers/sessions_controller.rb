class SessionsController < ApplicationController

  def create
    user = User.find_by(name: username)
    if user.authenticate(password)
      session[:current_user] = user.id
      redirect_to root_path, notice: "You're in, go nuts"
    else
      render :new, notice: "Fail"
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: "Peace"
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
