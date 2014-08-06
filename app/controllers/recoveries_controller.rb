class RecoveriesController < ApplicationController
  before_filter :signed_out_user, only: [:new]
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
      if @recovery.save
        UserMailer.change_password_link(@recovery.user,@recovery).deliver
        flash[:notice]="chek email"
        redirect_to :root
      else
        flash[:notice]=@recovery.errors.count
        render 'recoveries/new'
      end
      #отправить емайл с ключем
    end      
  end
end
