require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validation' do
    it { should validate_presence_of   :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of   :password }
    it { should validate_presence_of   :token }
    it { should validate_uniqueness_of :token }
  end

  describe 'Method' do

    before(:each) do
      @user = User.new(email: 'email', password: 'password')
      @user.generate_api_key
      @user.save!
    end

    it 'generates a token' do
      expect(@user.id).to_not      be_falsey
      expect(@user.token.class).to eq(String)
      expect(@user.token.size).to  be > 10
    end

    it 'confirms password' do
      confirm = 'password'
      expect(@user.confirm(confirm)).to eq(true)
      confirm = 'pass'
      expect(@user.confirm(confirm)).to eq(false)
    end

  end


end
