require 'rails_helper'


describe "Coordinates" do

  let(:location)    { "Denver,CO" }
  let(:google)      { GoogleService.new( {target: :address, location: location}) }
  let(:data)        { google.target_data }
  let(:coordinates) { Coordinates.new(data) }
  let(:pair)        { '39.7392358,-104.990251' }

  # TO DO -- STUB HERE for the service object

  before(:each) do
    stub_geocode_denver
  end


  it 'initializes with raw data from google service' do
    expect(coordinates.class).to eq(Coordinates)
  end

  it 'can provide a string-pair of latitude & longitude coordiantes' do
    string = coordinates.pair
    expect(string).to eq(pair)
  end

end
