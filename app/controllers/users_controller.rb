class UsersController < ApplicationController
  skip_before_filter :require_login

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      Notifier.welcome(user).deliver
      redirect_to projects_path, :notice => "Registered"
    else
      flash[:error] = "Invalid email or password"
      render "new"
    end
  end
end
