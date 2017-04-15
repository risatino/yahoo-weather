class WeathersController < ApplicationController
  def index
    @weathers = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22charleston%2C%20sc%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @channel = @weathers["query"]["results"]["channel"]
  end
end
