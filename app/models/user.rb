class User < ActiveRecord::Base
  before_create :generate_remember_token

  validates :username, presence: true, length: { in: 4..25 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  private
  
    def generate_remember_token
      token = SecureRandom.urlsafe_base64
      token_digest = Digest::SHA1.hexdigest(token)
      self.remember_token = token_digest
    end
end
