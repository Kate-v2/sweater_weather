require "rails_helper"


describe " some" do

  it "" do
    stub_geocode_denver
    stub_dark_sky_denver
    # get api_v1_user_path
    get '/api/v1/forecasts?location=Denver,CO'

    # binding.pry
    # expect(response.body).to

  end



end
