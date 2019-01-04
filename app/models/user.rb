
class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :token, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  def generate_api_key
    self.token = SecureRandom.base64
  end

  def confirm(confirmation)
    password == confirmation
  end

end
