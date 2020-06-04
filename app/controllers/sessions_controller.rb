class SessionsController < ApplicationController
  
  def index
    session[:user_id] = 3
    user = session[:user_id] && User.find(session[:user_id])

    if user
      render json: user
    else
      render json: {"error": "No current user"}
    end
  end
  
  def create
    user = User.find_by(email: login_params[:email]) || User.create(login_params)

    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      render json: {"message": "#{session[:user_id]}"}
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
