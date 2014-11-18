require 'json'
require 'open-uri'

Forecaster = Struct.new(:api_key) do
  def self.forecast(location)
    forecaster.forecast(location)
  end

  def self.forecaster
    return @forecaster if defined?(@forecaster)

    @forecaster = self.new(ENV['FORECAST_API_KEY'])
  end

  def forecast(location)
    lat, long = location.lat, location.long
    url = "https://api.forecast.io/forecast/#{api_key}/#{lat},#{long}"
    response = JSON.load(open(url))
  end
end
