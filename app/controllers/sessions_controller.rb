class SessionsController < ApplicationController
  def create
    user = User.from_omniauth env["omniauth.auth"]
    session[:user_id] = user.id
    redirect_to activities_url, notice: "<strong>Welcome #{user.name}!</strong> You have signed in with Facebook"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been signed out"
  end
end
