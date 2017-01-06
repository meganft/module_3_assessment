class BestBuyLocation

  attr_reader :long_name, :city, :distance, :phone, :store_type, :id

  def initialize(attributes={})
    @long_name = attributes["longName"]
    @city = attributes["city"]
    @distance = attributes["distance"]
    @phone = attributes["phone"]
    @store_type = attributes["storeType"]
    @id = attributes["storeId"]
  end

  def self.by_zip(zip)
    service = BestBuyService.new
    service.by_location(zip).map do |store_info|
      BestBuyLocation.new(store_info)
    end
  end

  def self.store_count(zip)
    service = BestBuyService.new
    service.find_number(zip)
  end

  def self.store_info(id)
    service = BestBuyService.new
    service.store_info(id)
  end

end
