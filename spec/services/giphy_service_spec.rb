require 'rails_helper'


describe "Giphy Service" do

  # TO DO - Stub -current, -today, -forecast, location

  let(:target) { { target: :search, term: "Clear throughout the day." } }
  let(:giphy)  { GiphyService.new( target ) }
  let(:raw)    { giphy.target_data }
  let(:data)   { raw[:data] }

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver
    stub_gif_day1_denver
  end

  it 'gets forecast data' do
    expect(raw.class).to  eq(Hash)
    expect(data.class).to eq(Array)

    gif  = data.first
    expect(gif.keys).to  include(:url)
    expect(gif[:url]).to eq("https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4")
  end

  describe 'Private or Class Methods' do

    it 'private - does not endpoint' do
      g = spy('giphy_service')
      expect(giphy.send(:endpoint)).to_not be_falsey
      expect(g).to have_not_received(:endpoint)
    end

    it 'private - does not target' do
      g = spy('giphy_service')
      expect(giphy.send(:target)).to_not be_falsey
      expect(g).to have_not_received(:target)
    end

    it 'private - does not term' do
      g = spy('giphy_service')
      expect(giphy.send(:term)).to_not be_falsey
      expect(g).to have_not_received(:term)
    end

    it 'private - does not format_query' do
      g = spy('giphy_service')
      expect(giphy.send(:format_query)).to_not be_falsey
      expect(g).to have_not_received(:format_query)
    end

    it 'private - does not get_json' do
      g = spy('giphy_service')
      link = [
        target       = '/v1/gifs/search',
        key_param    = "?api_key=#{ ENV['giphy_key'] }",
        query_term   = "&q=#{ "Clear throughout the day."}",
        limit        = "&limit=8",
        offset       = "&offset=0",
        rating       = "&rating=G",
        lang         = "&lang=en"
      ].join
      expect(giphy.send(:get_json, link)).to_not be_falsey
      expect(g).to have_not_received(:get_json, link)
    end

    it 'private - does not giphy_connection' do
      g = spy('giphy_service')
      expect(giphy.send(:giphy_connection)).to_not be_falsey
      expect(g).to have_not_received(:giphy_connection)
    end


  end

end
