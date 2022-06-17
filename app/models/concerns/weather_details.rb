require 'net/http'
require 'json'

class WeatherDetails
  API_KEY = 'ba0fc5acc907496d80c185358221606'
  # usage
  # WeatherDetails.new(WeatherDetails.postcode_uri('M14 4BG')).api_response
  # WeatherDetails.new(WeatherDetails.historical_postcode_uri('M14 4BG')).api_response

  def initialize(uri)
    @uri = URI(uri)
  end

  def api_response
    Net::HTTP.get(@uri)
  end

  def self.current_postcode_uri(postcode)
    "http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{postcode}&aqi=no"
  end

  def self.historical_postcode_uri(postcode)
    query = {key: API_KEY, q: postcode, dt: Date.today.to_s}.to_query
    "http://api.weatherapi.com/v1/history.json?#{query}"
  end
end

# console usage
# w = WeatherDetails.new(WeatherDetails.historical_postcode_uri('M14 4BG')).api_response
# JSON.parse(w)['forecast']['forecastday'].first['day']['maxtemp_c']
