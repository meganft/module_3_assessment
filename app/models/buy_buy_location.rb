class BestBuyLocation

  # attr_reader :period, :day, :description

  def initialize(attributes={})
    # @period = attributes["period"]
    # @day = attributes["title"]
    # @description = attributes["fcttext"]

  end

  def self.find_location
    service = BestBuyService.new
    service.by_location(zip).map do |store_info|
      BestBuyLocation.new(store_info)
    end
  end

end
