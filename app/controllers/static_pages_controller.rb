class StaticPagesController < ApplicationController
  def top
    uri = URI.parse("https://api.openweathermap.org/data/2.5/forecast?id=1851259&lang=ja&units=metric&appid=#{Rails.application.credentials.weather[:api_key]}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    @lists = result["list"]
  end
end
