
class NewUserSerializer

  include FastJsonapi::ObjectSerializer

  attribute :api_key { |u| u.token }

end
