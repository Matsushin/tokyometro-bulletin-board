require 'rails_helper'

RSpec.describe Datapoints, :type => :model do
  describe 'get_near_stations_by_railway method' do
    context 'incorrect parameter case' do
      it 'near stations should be empty' do
        station = 'dummy'
        railway = 'dummy'
        near_stations = Datapoints.get_near_stations_by_railway(station, railway)
        expect(near_stations.empty?).to eq true
      end
    end

    context 'normal case' do
      it 'near stations count should be 5' do
        station = 'odpt.Station:TokyoMetro.Chiyoda.Otemachi'
        railway = 'odpt.Railway:TokyoMetro.Chiyoda'
        near_stations = Datapoints.get_near_stations_by_railway(station, railway)
        expect(near_stations['stations'].size).to eq 5
      end
    end
  end

  describe 'search_train_location_by_station method' do
    context 'incorrect parameter case' do
      it 'train location should be empty' do
        station = 'dummy'
        railway = 'dummy'
        locations = Datapoints.search_train_location_by_station(station, railway)
        expect(locations.empty?).to eq true
      end
    end

    # 列車が走っていない深夜や早朝ではデータは取れない事に注意
    context 'normal case' do
      it 'train location should not be empty' do
        station = 'odpt.Station:TokyoMetro.Chiyoda.Ayase'
        railway = 'odpt.Railway:TokyoMetro.Chiyoda'
        locations = Datapoints.search_train_location_by_station(station, railway)
        expect(locations.empty?).to eq false
      end
    end
  end

  describe 'get_station_name method' do
    context 'incorrect parameter case' do
      it 'station name should be empty' do
        station = 'dummy'
        name = Datapoints.get_station_name(station)
        expect(name.empty?).to eq true
      end
    end

    context 'normal case' do
      it 'station name should not be empty' do
        station = 'odpt.Station:TokyoMetro.Ginza.Kanda'
        name = Datapoints.get_station_name(station)
        expect(name).to eq '神田'
      end
    end
  end
end
