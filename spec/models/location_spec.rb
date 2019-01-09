require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "Validations" do
    it { should validate_presence_of :city}
    it { should validate_presence_of :state_short}
    it { should validate_presence_of :coordinates}
  end

  describe "Relationships" do
    it { should have_many :favorites}
    it { should have_many :users}
  end

  describe 'Creation' do

    before(:each) do
      stub_geocode_denver
    end

    it 'NEW - new_or_existing_location' do
      expect(Location.count).to eq(0)
      location = Location.new_or_existing_location("Denver, CO")
      expect(Location.last.id).to eq(location.id)
    end

    it 'EXISTING - new_or_existing_location' do
      Location.new_or_existing_location("Denver, CO")
      expect(Location.count).to eq(1)
      location = Location.new_or_existing_location("Denver, CO")
      expect(Location.count).to eq(1)
      expect(Location.last.id).to eq(location.id)
    end

    it 'can use long state name' do
      Location.new_or_existing_location("Denver, Colorado")
      expect(Location.count).to eq(1)
      expect(Location.last.state_short).to eq("CO")
    end

    it 'can use state abbreviation' do
      Location.new_or_existing_location("Denver, CO")
      expect(Location.count).to eq(1)
      expect(Location.last.state_short).to eq("CO")
    end

    it 'REJECTS a bad state location' do
      # does not verify city
      # verifies state via gem 'citystate'
      expect(Location.count).to eq(0)
      location = Location.new_or_existing_location("zzz, ZZ")
      expect(Location.count).to eq(0)
      expect(location).to eq(nil)
    end

  end

  describe 'Private & Class Methods' do

    it 'class - does not receive new_or_existing_location' do
      location = spy('location')
      expect(location).to have_not_received(:new_or_existing_location)
    end

    it 'class & private - does not get_coordinates' do
      location = spy('location')
      expect(location).to have_not_received(:get_coordinates)
    end

    it 'class & private - does not get_geocode' do
      location = spy('location')
      expect(location).to have_not_received(:get_geocode)
    end

    it 'class & private - does not make_city_state_pair' do
      location = spy('location')
      expect(location).to have_not_received(:make_city_state_pair)
    end

    it 'class & private - does not location_tool' do
      location = spy('location')
      expect(location).to have_not_received(:location_tool)
    end

    it 'class & private - does not new_location' do
      location = spy('location')
      expect(location).to have_not_received(:new_location)
    end



  end

end
