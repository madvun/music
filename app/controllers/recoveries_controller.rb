class RecoveriesController < ApplicationController
  def new
    @recovery=Recovery.new  
  end
  def create
    if !recovery_user?(params[:recovery][:email])
      flash[:notice]="wrong email"
      redirect_to :root
    else
      @recovery=Recovery.new(user:recovery_user(params[:recovery][:email]))
      @recovery.create_key
      @recovery.save
      UserMailer.change_password_link(@recovery.user,@recovery).deliver
      flash[:notice]=@recovery.user.email
      redirect_to :root
      #отправить емайл с ключем
    end      
  end
end
