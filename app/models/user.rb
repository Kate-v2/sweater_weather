
class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :token, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  def self.make_user(data)
    base = { email: data[:email], password: data[:password] }
    user = User.new(base)
    return unless user.confirm(data[:password_confirmation])
    user.generate_api_key
    return unless user.save!
    user
  end

  def confirm(confirmation)
    password == confirmation
  end


  # private
  def generate_api_key
    api_key = self.token = SecureRandom.base64
    generate_api_key if User.find_by_token(api_key)
    api_key
  end

end
