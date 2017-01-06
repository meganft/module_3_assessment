class Api::V1::ItemsController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def index
    render json: Item.all
  end

  def create
    item = Item.find(item_params)
    if item.save
      render json: item
    end
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: Item.all, :status => 204
  end

  private

    def item_params
      params.require(:item).permit(:zip)

end
