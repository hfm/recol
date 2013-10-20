class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_omniauth(auth) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to users_path, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to signin_path
  end

end
