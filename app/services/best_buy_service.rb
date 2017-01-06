class BestBuyService

  def initialize
  end

  def by_location(zip)
    response =
    Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["api_key"]}")
    @response = JSON.parse(response.body)["stores"]
    # @info = JSON.parse(response.body)["total"]
  end
end
