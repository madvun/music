class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "successfully"
      redirect_to :root
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
