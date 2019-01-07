require 'rails_helper'


RSpec.describe "Login User" do

  it 'logs in' do

    # skip("Response.body MISSING")

    account = {
      email:    'email@email.com',
      password: 'password'
    }
    user = User.create( email: account[:email], password: account[:password], token: '1234abc' )

    url     = '/api/v1/sessions'
    params  = account.to_json
    # headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
    page.driver.submit(:post, url, user: params)

    # JSON is visible, but response is inaccessible
    # save_and_open_page
    # DOES THIS NEED A STUB ???

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:api_key]).to  eq(user.token)
  end


end
