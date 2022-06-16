require 'net/http'
require 'json'

class WeatherDetails
  # usage
  # WeatherDetails.new('http://api.weatherapi.com/v1/current.json?key=&q=M14 4BG&aqi=no').request_api
  def initialize(uri)
    @uri = URI(uri)
  end

  def api_response
    Net::HTTP.get(@uri)
  end

  def self.postcode_uri(postcode)
    "http://api.weatherapi.com/v1/current.json?key=ba0fc5acc907496d80c185358221606&q=#{postcode}&aqi=no"
  end
end
