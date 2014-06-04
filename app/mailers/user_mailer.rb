class UserMailer < ActionMailer::Base
  default from: "hoangphanbk10@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://www.google.com"
    mail(:to => user.email, :subject => "Welcome")
  end
end