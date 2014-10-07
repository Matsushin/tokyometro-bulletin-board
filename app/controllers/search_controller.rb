class SearchController < ApplicationController
  def index
  end

  # 接近情報検索
  def approach
    if params['railway'].blank? || !params['railway'].match('|')
      redirect_to root_path, notice: '接近情報の取得に失敗しました'
      return
    end

    station, railway = params['railway'].split('|')

    # 指定路線から最寄り駅の隣接駅一覧取得
    @stations = Datapoints.get_near_stations_by_railway(station, railway)
    @locations = []

    # 列車ロケーション情報の取得
    @stations['stations'].each do |station|
      location = Datapoints.search_train_location_by_station(station['odpt:station'], railway)
      @locations.push(location)
    end
  end

  # 最寄り駅検索
  def near_station
    lat = params[:lat] # 緯度
    lon = params[:lon] # 経度
    places = Places.search_near_station_by_lat_and_lon(lat.to_s, lon.to_s)
    render :json => places
  end
end
