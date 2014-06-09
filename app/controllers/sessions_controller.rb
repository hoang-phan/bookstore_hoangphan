class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    email = params[:user][:email]
    user = User.find_by_email(email)
    user.update_attribute(:login_count, 0) if user && user.valid_password?(params[:user][:password])
    if session[:captcha] && !verify_recaptcha
      redirect_to new_user_session_path
    else
      super
    end
  end
end