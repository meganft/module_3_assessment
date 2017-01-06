class BestBuyService

  def initialize
  end

  def by_location(zip)
    response =
    Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=store_id,longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["api_key"]}")
    @response = JSON.parse(response.body)["stores"]
  end

  def find_number(zip)
    response =
    Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=store_id,longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["api_key"]}")
    @response = JSON.parse(response.body)["total"]
  end

  def store_info(id)
      response = Faraday.get("https://api.bestbuy.com/v1/stores(storeId=1118)?format=json&show=hours,hoursAmPm,gmtOffset,detailedHours&apiKey=#{ENV["api_key"]}")
    @response = JSON.parse(response.body)
  end

end
