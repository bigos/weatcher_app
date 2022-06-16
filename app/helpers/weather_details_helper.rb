module WeatherDetailsHelper
    def temperature
        if @temperature.to_i <= 15
            "Weather is Cold."
        elsif @temperature.to_i >= 16
            "Weather is Warm."
        else @temperature.to_i > 17
            "Weather is Hot"
        end
    end
end
