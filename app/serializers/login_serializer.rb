
class LoginSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id
  attribute :api_key { |u| u.token }

end
