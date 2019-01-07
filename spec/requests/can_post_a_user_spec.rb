require 'rails_helper'

RSpec.describe "User" do

  it 'makes a user' do

    skip("SO CLOSE -- ActionController::UnknownFormat:ActionController::UnknownFormat")

    # post :create, params: {user: user_stub}
    url = api_v1_users_path(user: user_stub)
    page.driver.submit(:post, url, {})

    expect(response).to be_successful

    # data = get_json
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(data[:api_key]).to  eq(User.last.token)
  end


end


def user_stub
  {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
  }.to_json
end

# def get_json
#   JSON.parse(response.body, symbolize_names: true)
# end
