class ActivationsController < ApplicationController
  def show
    @user = User.find_by_activation_token(params[:id])

    @user.update_attribute(:activated, true)
    flash[:success] = "Your account is now activated."
    redirect_to root_path
  end
end
