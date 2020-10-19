class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    Address.create(address_params)
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end
end
