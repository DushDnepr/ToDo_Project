class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
    if current_user
      redirect_to projects_path
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, :notice => "Logged in!"
    else
      flash[:error] = "Invalid email or password"
      render "sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
