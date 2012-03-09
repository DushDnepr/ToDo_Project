class Notifier < ActionMailer::Base
  default from: "dushdnepr@gmail.com"

  def welcome (user)
    @account = user
    mail(:to => user.email, :template_path => 'notificaions', :template_name => 'notifier/hello')
  end

  def invite (project, user)
    @project = project
    mail(:to => user.email, :template_path => 'notificaions', :template_name => 'notifier/invite')
  end
end
