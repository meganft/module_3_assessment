class Api::V1::ItemsController < ApplicationController

  def show
  end

  def index
    render json: Item.all
  end

  def create
  end

  def update
  end

  def destroy
  end

end