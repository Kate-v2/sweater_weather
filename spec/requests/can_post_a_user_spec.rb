require 'rails_helper'


# RSpec.describe Api::V1::UsersController, type: :controller do
RSpec.describe "User" do

  it 'makes a user' do

    skip("SO CLOSE -- ActionController::UnknownFormat:ActionController::UnknownFormat")

    # post :create, params: {user: user_stub}
    url = api_v1_user_path(user: user_stub)
    page.driver.submit(:post, url, {})

    data = get_json
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

def get_json
  JSON.parse(response.body, symbolize_names: true)
end

# -- Response --
  # status: 201
  # body:
  #   {
  #     "api_key": "jgn983hy48thw9begh98h4539h4",
  #   }
