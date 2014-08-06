class Recovery < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :uniqueness => true
  attr_accessor :email
  def create_key
    self.key=SecureRandom.urlsafe_base64
  end
end
