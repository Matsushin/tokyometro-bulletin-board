require 'rails_helper'

RSpec.describe SearchHelper, :type => :helper do
  describe 'get_train_type_name method' do
    context 'incorrect parameter case' do
      it 'train type name should be nil' do
        train_type = 'dummy'
        expect(helper.get_train_type_name(train_type)).to eq nil
      end
    end

    context 'normal case' do
      it 'train type name should be 急行' do
        train_type = 'odpt.TrainType:TokyoMetro.Express'
        expect(helper.get_train_type_name(train_type)).to eq '急行'
      end
    end
  end

  describe 'get_rail_direction_name method' do
    context 'incorrect parameter case' do
      it 'rail direction name should be nil' do
        rail_direction = 'dummy'
        expect(helper.get_rail_direction_name(rail_direction)).to eq nil
      end
    end

    context 'normal case' do
      it 'rail direction name should be 渋谷' do
        rail_direction = 'odpt.RailDirection:TokyoMetro.Shibuya'
        expect(helper.get_rail_direction_name(rail_direction)).to eq '渋谷'
      end
    end
  end
end
