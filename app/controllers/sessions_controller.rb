class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @captcha = exceed_max_logins?(user)
    logger.debug("#{@captcha ? 'ok' : 'wrong'}")

    if user && user.authenticate(params[:session][:password]) && (!@captcha || verify_recaptcha(model: :session, message: "You enter wrong captcha"))
        reset_login_count user
        sign_in user
        redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
