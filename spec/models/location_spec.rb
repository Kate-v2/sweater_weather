require 'rails_helper'

RSpec.describe Location, type: :model do

  describe 'Methods' do

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

    it 'can use longs state name' do
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


end
