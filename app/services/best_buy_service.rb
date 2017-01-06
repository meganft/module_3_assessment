class BestBuyService

  # def initialize
  #   @conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=store_id,longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV["api_key"]}") do |faraday|
  #     faraday.request  :url_encoded             # form-encode POST params
  #     faraday.response :logger                  # log requests to STDOUT
  #     faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  #   end
  # end

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
    @response = JSON.parse(response.body)["stores"].first["hours"]
  end

end
