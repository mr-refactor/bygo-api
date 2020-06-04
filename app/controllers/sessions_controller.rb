class SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email]) || User.create(login_params)

    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      render json: {"message": "You are successfully logged in"}
    else
      render json: {"message": "Invalid Username or Password"}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {"message": "log out successful"}
  end

  private

    def login_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
