class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    if session[:captcha] && !verify_recaptcha
      redirect_to new_user_session_path
    else
      user = User.find_by_email(params[:user][:email])
      session[:captcha] = user.check_login(params[:user][:password]) if user
      super
    end
  end
end