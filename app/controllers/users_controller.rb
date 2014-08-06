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
  def edit_password
    if !recovery_user_with_key?(params[:key])
      recovery_user_with_key(params[:key])
    else
      flash[:notice] = "Sorry, try again"
      redirect_to :root
    end   
  end
  def update_password
    recovery_user_with_key(params[:key])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated"
      sign_in @user
      recovery_delete(params[:key])
      redirect_to :root
    else
      flash[:notice] = "error"
      render 'users/edit_password'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
