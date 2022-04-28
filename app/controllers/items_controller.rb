class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :states_id, :category_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
