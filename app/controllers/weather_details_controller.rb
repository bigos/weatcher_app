class WeatherDetailsController < ApplicationController
  def weather_search
    current_postcode_uri = WeatherDetails.current_postcode_uri(params[:postcode])
    @weather = JSON.parse WeatherDetails.new(current_postcode_uri).api_response

    #Saves temperature in degree C for the search input

    if @weather.keys.include? 'current'
      @temperature = @weather['current']['temp_c']
    else
      redirect_to search_path, alert: @weather.to_s
    end
  end

end
