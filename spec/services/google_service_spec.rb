require 'rails_helper'


describe "Google Service" do

  let(:location) { 'Denver,CO'  }
  let(:lat)      {   39.7392358 }
  let(:lng)      { -104.990251  }

  before(:each) do
    stub_geocode_denver
  end

  it 'gets location data' do
    filter  = {target: :address, location: location}
    service = GoogleService.new(filter)
    json    = service.target_data
    expect(json.class).to eq(Hash)
    expect(json.keys).to include(:results)
    expect(json.keys).to include(:status)
    location = json[:results].first[:geometry][:location]
    expect(location[:lat]).to eq(lat)
    expect(location[:lng]).to eq(lng)
  end

end
