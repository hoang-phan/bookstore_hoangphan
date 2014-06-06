class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
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

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end