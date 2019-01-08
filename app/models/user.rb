
class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates :token, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  has_many :favorites
  has_many :locations, through: :favorites


  def self.make_user(data)
    base = { email: data[:email], password: data[:password] }
    user = User.new(base)
    return unless user.confirm(data[:password_confirmation])
    user.generate_api_key
    return unless user.save!
    user
  end

  def specific_favorite(location)
    # This should also confirm that state is in the short format
    city, state = location.split(','); state.gsub!(' ', '')
    self.favorites.joins(:location)
                  .where(locations: {city: city, state_short: state})
                  .first
  end

  # TODO - make this private -- affects tests & factorybot
  # AND above method
  def generate_api_key
    api_key = self.token = SecureRandom.base64
    generate_api_key if User.find_by_token(api_key)
    api_key
  end

  # TODO - make this private -- affects tests AND above method
  def confirm(confirmation)
    password == confirmation
  end


end
