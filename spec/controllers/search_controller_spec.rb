require 'rails_helper'

RSpec.describe SearchController, :type => :controller do
  describe 'approach method' do
    context 'incorret parameter case' do
      it 'redirects to search#index' do
        post :approach, railway: nil
        expect(response).to redirect_to root_path
      end
    end

    context 'normal case' do

      it 'renders the :approacrh template' do
        post :approach, railway: 'odpt.Station:TokyoMetro.Ginza.Suehirocho|odpt.Railway:TokyoMetro.Ginza'
        expect(response).to render_template :approach
      end

      it 'assigns the requested parameter to @stations' do
        post :approach, railway: 'odpt.Station:TokyoMetro.Ginza.Suehirocho|odpt.Railway:TokyoMetro.Ginza'
        expect(assigns(:stations)['stations'].first['title']).to eq '三越前'
      end

      it 'assigns the requested parameter to @locations' do
        post :approach, railway: 'odpt.Station:TokyoMetro.Ginza.Suehirocho|odpt.Railway:TokyoMetro.Ginza'
        expect(assigns(:locations).is_a? Array).to be_truthy
      end
    end
  end

  describe 'near_station method' do
    context 'incorrect parameter case' do
      it 'returns a JSON data' do
        post :near_station, {lat: 111, lon: 222}
        expect(response.headers['Content-Type']).to have_content 'application/json'
      end

      it 'near station should be empty'do
        post :near_station, {lat: 111, lon: 222}
        expect(JSON.parse(response.body).empty?).to eq true
      end
    end

    context 'normal case' do
      it 'near staion should not be empty' do
        post :near_station, {lat: 35.70224034, lon: 139.77441229}
        expect(JSON.parse(response.body).first['dc:title']).to eq '末広町'
      end
    end
  end
end
