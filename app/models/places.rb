class Places < TokyometroApi
  CATEGORY = "places"

  # 緯度、経度から最寄りの駅一覧を取得
  def self.search_near_station_by_lat_and_lon(lat, lon)
    params = {
      'rdf:type' => 'odpt:Station',
      'lon'      => lon,
      'lat'      => lat,
      'radius'   => 1000
    }
    response = call_api(CATEGORY, params)
    response
  end
end
