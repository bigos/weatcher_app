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

  # https://www.weatherapi.com/api-explorer.aspx#history
  # http://api.weatherapi.com/v1/history.json?key=ba0fc5acc907496d80c185358221606&q=London&dt=2010-01-01

  #http://api.weatherapi.com/v1/history.json?key=ba0fc5acc907496d80c185358221606&q=London&dt=2021-01-01

  def self.historical_postcode_uri(postcode)
    "http://api.weatherapi.com/v1/historical.json?key=#{API_KEY}&q=#{postcode}&aqi=no"
  end
end
