module RecoveriesHelper
  def recovery_user(email)
    @user=User.find_by(email: email)    
  end
  def recovery_user?(email)
    !User.find_by(email: email).nil?
  end
  def recovery_user_with_key?(key)
    Recovery.find_by(key: key).nil?
  end
  def recovery_user_with_key(key)
    @user=Recovery.find_by(key: key).user
  end
  def has_key?
    !params[:key].nil?    
  end
  def recovery_delete_key(key)
    Recovery.find_by(key: key).destroy
  end
end
