
class LoginSerializer

  include FastJsonapi::ObjectSerializer

  attribute :id
  attribute :api_key { :token }

end
