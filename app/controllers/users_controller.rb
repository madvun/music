class UsersController < ApplicationController
  before_filter :signed_out_user, only: [:edit_password, :update_password, :new]
  before_filter :signed_in_user, only: [:edit, :update]
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
  def edit
    @user=current_user
  end
  def update
    @user=current_user
    if @user.authenticate(params[:user][:password_last])
      if @user.update_attributes(user_params)
        flash[:notice] = "Profile updated"
        redirect_to :root
      else
        flash[:notice] = @user.errors.count.to_s+" errors"
        render 'users/edit'
      end
    else
      flash[:notice] = "wrong password"
      render 'users/edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
  end
end
