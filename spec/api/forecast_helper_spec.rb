require 'rails_helper'


describe "ForecastHelper" do

  let(:location)    { 'Denver,CO' }
  let(:coordinates) { '39.7392358,-104.990251' }
  let(:helper)      { ForecastHelper.new(location) }

  before(:each) do
    stub_geocode_denver
  end


  it 'initializes with location' do
    klass  = helper.class
    expect(klass).to eq(ForecastHelper)
  end


end
