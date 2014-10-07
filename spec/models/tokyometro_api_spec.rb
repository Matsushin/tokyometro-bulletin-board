require 'rails_helper'

RSpec.describe TokyometroApi, :type => :model do
  describe 'call_api method' do
    context 'incorrect parameter case' do
      it 'respose should be empty' do
        category = ''
        params = {}
        result = TokyometroApi.call_api(category, params)
        expect(result.nil?).to eq true
      end
    end

    context 'normal case' do
      it 'response should not be empty' do
        category = 'datapoints'
        params = {
          'rdf:type' => 'odpt:Station',
          'owl:sameAs' => 'odpt.Station:TokyoMetro.Tozai.Otemachi'
        }
        result =TokyometroApi.call_api(category, params)
        expect(result.empty?).to eq false
      end
    end
  end
end
