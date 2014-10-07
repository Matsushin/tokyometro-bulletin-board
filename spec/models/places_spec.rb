require 'rails_helper'

RSpec.describe Places, :type => :model do
  describe 'search_near_station_by_lat_and_lon method' do
    context 'near station does not exist'  do
      it 'near station should be empty' do
        lat = 0
        lon = 1
        result = Places.search_near_station_by_lat_and_lon(lat, lon)
        expect(result.empty?).to eq true
      end
    end

    context 'normal case' do
      it 'near station should not be empty' do
        lat = '35.70224034'
        lon = '139.77441229'
        result = Places.search_near_station_by_lat_and_lon(lat, lon)
        expect(result[0]['dc:title']).to eq '末広町'
      end
    end
  end
end
