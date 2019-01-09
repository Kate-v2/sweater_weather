require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validation' do
    it { should validate_presence_of   :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of   :token }
    it { should validate_uniqueness_of :token }
    it { should validate_presence_of   :password }
    it { should have_secure_password }
  end

  describe "Relationships" do
    it { should have_many :favorites }
    it { should have_many :locations }
  end

  it 'Creation' do
    params = { email: "email", password: "password", password_confirmation: "password" }
    user = User.make_user( params )
    expect(user.class).to               eq(User)
    expect(user.email).to               eq(params[:email])
    expect(user.password).to_not        be(nil)
    expect(user.password).to            eq(params[:password])
    expect(user.password_digest).to_not eq(params[:password])
    expect(user.token).to_not           be(nil)
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

    it 'can find a specific favorite by location' do
      # CAN'T MOCK these because they need to be in DB
      loco1 = Location.new(city: 'Denver',   state_short: 'CO', coordinates: '123')
      loco2 = Location.new(city: 'New York', state_short: 'NY', coordinates: '123')
      @user.favorites.create(location: loco1)
      @user.favorites.create(location: loco2)

      term = 'Denver,CO'
      found = @user.specific_favorite(term)
      expect(found.class).to       eq(Favorite)
      expect(found.city).to        eq(loco1.city)
      expect(found.state_short).to eq(loco1.state_short)
      expect(found.coordinates).to eq(loco1.coordinates)
    end

    describe 'Private or Class Methods' do

      it 'class - does not make_user' do
        data = params = { email: "mail", password: "password", password_confirmation: "password" }
        user = spy('user')
        expect( User.send(:make_user, data)).to_not be_falsey
        # expect(@user.send(:make_user, data)).to     raise(NoMethodError)
        expect(user).to have_not_received(:make_user)
      end


    end


  end

end
