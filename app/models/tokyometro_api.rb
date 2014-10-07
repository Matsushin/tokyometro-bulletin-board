class TokyometroApi
  API_ENDPOINT   = 'https://api.tokyometroapp.jp/api/v2/'

  def self.call_api(category, params = {})
    params['acl:consumerKey'] = ENV['TOKYOMETRO_ACCESS_TOKEN']
    url = API_ENDPOINT + category
    results = RestClient.get(url, params: params)
    results = results.body.blank? ? nil : JSON.parse(results.body)
    results
  end
end