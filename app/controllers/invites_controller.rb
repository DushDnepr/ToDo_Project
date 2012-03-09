class InvitesController < ApplicationController
  before_filter :find_project

  def new
    @invite = @project.invites.build
  end

  def create
    user = User.find_by_email(params[:invite][:email].strip)
    if user
      if @project.users.include? user
        flash[:error] = "#{user.email} already in project"
        @invite = @project.invites.build
        render :new
      else
        @project.users << user
        Notifier.invite(@project, user).deliver
        redirect_to projects_path, :notice => "#{user.email} is invited to the project"
      end
    else
      flash[:error] = "#{params[:invite][:email]} not registered"
      @invite = @project.invites.build
      render :new
    end
  end

  def destroy
    @project.invites.where(user_id: params[:id]).first.destroy
    redirect_to projects_path, :notice => "User removed from the project"
  end

  private

  def find_project
    @project = Project.find_by_id params[:project_id]
  end
end
