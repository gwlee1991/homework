class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/session/new'
    mail(to: user.username, subject: 'Welcome to My Site')
  end
end
