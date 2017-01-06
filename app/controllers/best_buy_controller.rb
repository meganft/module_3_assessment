class BestBuyController < ApplicationController

  def index
    @locations = BestBuyLocation.by_zip(params[:zip])
    @number = BestBuyLocation.store_count(params[:zip])
  end

  def show
    @hours = BestBuyLocation.store_info(params[:id])
  end
end
