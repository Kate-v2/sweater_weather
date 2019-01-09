require 'rails_helper'


describe "Coordinates" do

  let(:google)      { instance_double("GoogleService")}
  let(:data)        { google.target_data }
  let(:response)    { make_geocode_data }
  let(:coordinates) { Coordinates.new( data ) }
  let(:pair)        { '39.7392358,-104.990251' }

  before(:each) do
    allow(google).to receive(:target_data).and_return( response )
  end

  it 'initializes with raw data from google service' do
    expect(coordinates.class).to eq(Coordinates)
  end

  it 'can provide a string-pair of latitude & longitude coordiantes' do
    string = coordinates.pair
    expect(string).to eq(pair)
  end

  describe 'Private or Class Methods' do

    it 'private - does not lat' do
      coord = spy('coordinates')
      expect(coord).to have_not_received(:lat)
    end

    it 'private - does not lng' do
      coord = spy('coordinates')
      expect(coord).to have_not_received(:lng)
    end

    it 'private - does not city' do
      coord = spy('coordinates')
      expect(coord).to have_not_received(:city)
    end

    it 'private - does not state' do
      coord = spy('coordinates')
      expect(coord).to have_not_received(:state)
    end

    it 'private - does not country' do
      coord = spy('coordinates')
      expect(coord).to have_not_received(:country)
    end

  end

end

def make_geocode_data
  file = File.read( stub_geocode_denver_path )
  JSON.parse( file, symbolize_names: true)
end
