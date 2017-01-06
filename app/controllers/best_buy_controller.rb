class BestBuyController < ApplicationController

  def index
     https://api.bestbuy.com/v1/stores(area(80210,25))?format=json&show=storeId,storeType,name&pageSize=15&apiKey=ENV['best_buy_api_key']

  end
end
