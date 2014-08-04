class SessionsController < ApplicationController
  def create
    user=User.find_by(email: params[:session][:email])
    if user&&user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice]="wellcome"
      redirect_to :root
    else
      flash[:notice]="wrong combination"
      redirect_to :root
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end
end
