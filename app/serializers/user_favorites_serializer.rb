
class UserFavoritesSerializer

  include FastJsonapi::ObjectSerializer

  attribute :location, :current_weather

end


  # {
  #   "location": "Denver, CO",
  #   "current_weather": {
  #     # This can vary but try to keep it consistent with the
  #     # structure of the response from the /forecast endpoint
  #   }
