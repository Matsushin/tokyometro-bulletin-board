class Datapoints < TokyometroApi
  API_ENDPOINT   = 'https://api.tokyometroapp.jp/api/v2/'
  DATAPOINTS_URL = API_ENDPOINT + "datapoints"
  CATEGORY = "datapoints"

  # 指定路線から最寄り駅の隣接駅一覧取得
  def self.get_near_stations_by_railway(current_station, railway)
    params = {
        'rdf:type'   => 'odpt:Railway',
        'owl:sameAs' => railway
    }

    results = call_api(CATEGORY, params)
    if results.empty?
      return ''
    end
    stations = results[0]['odpt:stationOrder'] # 該当路線の駅全て取得
    current_data = stations.find {|station|station['odpt:station'] == current_station}
    if !current_data
      return ''
    end
    current_index = current_data['odpt:index']
    data = stations.find_all {|station|
      station['odpt:index'] == current_index - 2 || # 前の前の駅
      station['odpt:index'] == current_index - 1 || # 前の駅
      station['odpt:index'] == current_index || # 最寄り駅
      station['odpt:index'] == current_index + 1 || # 次の駅
      station['odpt:index'] == current_index + 2 # 次の次の駅
    }

    # 駅名を取得して入れ直す
    data = data.map {|station|
      station['title'] = get_station_name(station['odpt:station'])
      station
    }

    response = {
      'title' => results[0]['dc:title'], # 路線名
      'current_index' => current_index, # 最寄りの駅番号
      'current_title' => get_station_name(current_station), # 最寄りの駅名
      'stations' => data # 最寄りの駅の前後2つ先の駅情報
    }
    response
  end

  # 指定の駅に接近している電車情報取得
  def self.search_train_location_by_station(station, railway)
    params = {
      'rdf:type'         => 'odpt:Train',
      'odpt:railway'     => railway,
      'odpt:fromStation' => station
    }

    locations = call_api(CATEGORY, params)
    locations
  end

  # 駅名の取得
  def self.get_station_name(station)
    params = {
        'rdf:type'   => 'odpt:Station',
        'owl:sameAs' => station
    }

    stations = call_api(CATEGORY, params)
    stations.blank? ? '' : stations.first['dc:title']
  end
end