require 'rails_helper'

RSpec.describe Favorite, type: :model do

  let(:user) { create(:user) }

  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :location }

    it 'validates uniqueness of location-user pair' do
      # I don't think this test actually runs
      validate_uniqueness_of(:location).scoped_to(:user)
      validate_uniqueness_of(:location).scoped_to(user)
    end

    it { should delegate_method(:city).to(:location) }
    it { should delegate_method(:state_short).to(:location) }
    it { should delegate_method(:coordinates).to(:location) }
  end

  it 'should join location fields' do
    # loco = instance_double('Location', city: 'City', state_short: 'ST')
    loco = Location.new(city: 'City', state_short: 'ST', coordinates: '123')
    fav  = Favorite.new(user: user, location: loco)
    # fav  = instance_double('Favorite', city: 'City', state_short: 'ST')
    # allow(fav).to_receive(:joint_location)
    string = fav.joint_location
    expect(string).to eq('City,ST')
  end


end
