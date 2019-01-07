
module APIHelper

  def get_json
    JSON.parse(response.body, symbolize_names: true)
  end


end
