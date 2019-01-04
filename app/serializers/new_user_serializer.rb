
class NewUserSerializer

  include FastJsonapi::ObjectSerializer

  attributes :token

  # attributes :token, as: :api_key
  # attributes :id

  # attribute :api_key do |user|
  #   user.token
  # end

end
