class CustomFailure < Devise::FailureApp
  def respond
    if http_auth?
      http_auth
    else
      email = params[:user][:email]
      user = User.find_by_email(email)
      if user
        user.increment!(:login_count)
        user.save!
        session[:captcha] = user.login_count >= Integer(ENV['MAX_LOGIN_ATTEMPTS'])
      end
      redirect
    end
  end
end