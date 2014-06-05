class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    generate_activation_token
    if @user.save
      UserMailer.delay.send_activation(@user)
      render 'wait_activation'
    else
      render 'new'
    end
  end

   private

    def user_params
      params.require(:user).permit(:full_name, :email, :password,
                                   :password_confirmation, :birthday, :phone, :activation_token, :activated)
    end

    def generate_activation_token
      begin
        activation_token = SecureRandom.urlsafe_base64
      end while User.exists?(activation_token: activation_token)
      @user.update_attributes(activation_token: activation_token)
    end
end