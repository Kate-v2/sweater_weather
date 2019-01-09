require 'rails_helper'


describe "Google Service" do

  let(:location) { 'Denver,CO'  }
  let(:lat)      {   39.7392358 }
  let(:lng)      { -104.990251  }

  let(:filter)   { { target: :address, location: location } }
  let(:service)   { GoogleService.new(filter) }
  let(:json)     { service.target_data }


  before(:each) do
    stub_geocode_denver
  end

  it 'gets location data' do
    expect(json.class).to eq(Hash)
    expect(json.keys).to include(:results)
    expect(json.keys).to include(:status)
    location = json[:results].first[:geometry][:location]
    expect(location[:lat]).to eq(lat)
    expect(location[:lng]).to eq(lng)
  end

  describe 'Private or Class Methods' do

    it 'private - does not endpoints' do
      g = spy('google_service')
      expect(service.send(:endpoints)).to_not be_falsey
      expect(g).to have_not_received(:endpoints)
    end

    it 'private - does not target' do
      g = spy('google_service')
      expect(service.send(:target)).to_not be_falsey
      expect(g).to have_not_received(:target)
    end

    it 'private - does not key_param' do
      g = spy('google_service')
      expect(service.send(:key_param)).to_not be_falsey
      expect(g).to have_not_received(:key_param)
    end

    it 'private - does not format_query' do
      g = spy('google_service')
      expect(service.send(:format_query)).to_not be_falsey
      expect(g).to have_not_received(:format_query)
    end

    it 'private - does not get_json' do
      g = spy('google_service')
      link = "?address=#{'Denver,CO'}&key=#{ENV['google_key']}"
      expect(service.send(:get_json, link)).to_not be_falsey
      expect(g).to have_not_received(:get_json, link)
    end

    it 'private - does not location_connection' do
      g = spy('google_service')
      expect(service.send(:location_connection)).to_not be_falsey
      expect(g).to have_not_received(:location_connection)
    end
  end

end
