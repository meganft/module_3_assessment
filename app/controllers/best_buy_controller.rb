class BestBuyController < ApplicationController

  def index
    zip = params[:zip]
     response =
     Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["api_key"]}")
      @number = JSON.parse(response.body)["total"]
     @info = JSON.parse(response.body)["stores"]
  end
end
