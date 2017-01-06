class Api::V1::ItemsController < ApplicationController

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def index
    render json: Item.all
  end

  def create
    item = Item.create(item_params)
    if item.save
      render json: item, :status => 201
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
      params.require(:item).permit(:name, :description, :image_url)
    end

end
