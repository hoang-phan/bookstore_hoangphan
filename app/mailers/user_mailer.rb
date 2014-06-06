class UserMailer < ActionMailer::Base
  default from: "hoangphanbk10@gmail.com"

  def send_activation(user)
    @user = user
    mail(:to => "hoang.phan@eastagile.com", :subject => "Account activation")
  end
end