class User < ActiveRecord::Base
  attr_accessor :password_last
  has_secure_password
  has_one :recovery
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_NAME_REGEX = /\A[a-zA-Z]+( |-|[a-zA-Z]|.)+\z/i
  validates :first_name, presence: true,
            format: { with: VALID_NAME_REGEX },
            length: { maximum: 50} 

  VALID_EMAIL_REGEX = /\A[a-z\d]+([a-z\d]|([-._][a-z\d]))+@[a-z\d\-]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  VALID_PASS_REGEX = /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$+\z/i
  validates :password, presence: true,
            format: { with: VALID_PASS_REGEX },
            length: { minimum: 6 }

  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

