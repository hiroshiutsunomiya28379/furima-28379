class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  before_action :move_to_index, only: :edit
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else 
      render 'edit'
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :ship_charge_id, :ship_region_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
