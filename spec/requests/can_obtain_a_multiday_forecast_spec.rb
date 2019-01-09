require 'rails_helper'
require 'api_helper'


RSpec.describe Api::V1::ForecastsController, type: :controller do

  include APIHelper

  let(:location) { "Denver,CO" }

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver
  end

  describe '#INDEX' do

    before(:each) do
      get :index, params: {location: location}, body: nil, format: :json, as: :json
      @json = get_json[:data][:attributes]
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'current' do
      current = @json[:current]
      expect(current).to_not be(nil)
      expect(current[:time]).to        eq(1546556663)
      expect(current[:summary]).to     eq("Clear")
      expect(current[:icon]).to        eq("clear-day")
      expect(current[:temperature]).to eq(51.08)
      expect(current[:feels_like]).to  eq(51.08)
    end

    it 'today' do
      today = @json[:today]
      expect(today).to_not be(nil)
      expect(today[:time]).to        eq(1546585200)
      expect(today[:summary]).to     eq("Clear throughout the day.")
      expect(today[:icon]).to        eq("clear-day")
      expect(today[:low]).to         eq(25.39)
      expect(today[:high]).to        eq(49.91)
      expect(today[:humidity]).to    eq(0.58)
      expect(today[:visibility]).to  eq(10)
      expect(today[:uv_index]).to    eq(2)
    end

    it 'forecast' do
      forecast = @json[:forecast][:data]
      expect(forecast).to_not be(nil)
      expect(forecast[:attributes][:hourly]).to_not be(nil)
      expect(forecast[:attributes][:days]).to_not be(nil)
    end

    it 'forecast - hourly' do
      forecast = @json[:forecast][:data]
      hourly   = forecast[:attributes][:hourly]
      expect(hourly).to_not   be(nil)
      expect(hourly.count).to eq(49)

      hour = hourly.first
      expect(hour[:time]).to        eq(1546556400)
      expect(hour[:icon]).to        eq("clear-day")
      expect(hour[:temperature]).to eq(51.58)
    end

    it 'forecast - daily' do
      forecast = @json[:forecast][:data]

      days   = forecast[:attributes][:days]
      expect(days).to_not   be(nil)
      expect(days.count).to eq(8)

      day = days.first
      expect(day[:icon]).to               eq("clear-day")
      expect(day[:summary]).to            eq("Clear throughout the day.")
      expect(day[:precip_probability]).to eq(0.02)
      expect(day[:precip_type]).to        eq('snow')
      expect(day[:low]).to                eq(27.37)
      expect(day[:high]).to               eq(55.38)
    end

    it 'location' do
      location = @json[:location]
      city    = location[:city]
      state   = location[:state]
      country = location[:country]

      expect(city.class).to           eq(Hash)
      expect(city[:short_name]).to    eq('Denver')
      expect(city[:long_name]).to     eq('Denver')

      expect(state.class).to          eq(Hash)
      expect(state[:short_name]).to   eq('CO')
      expect(state[:long_name]).to    eq('Colorado')


      expect(country.class).to        eq(Hash)
      expect(country[:short_name]).to eq('US')
      expect(country[:long_name]).to  eq('United States')
    end
  end

end
