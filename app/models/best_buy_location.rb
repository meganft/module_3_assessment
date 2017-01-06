class BestBuyLocation

  attr_reader :long_name, :city, :distance, :phone, :store_type

  def initialize(attributes={})
    @long_name = attributes["longName"]
    @city = attributes["city"]
    @distance = attributes["distance"]
    @phone = attributes["phone"]
    @store_type = attributes["storeType"]
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

end
