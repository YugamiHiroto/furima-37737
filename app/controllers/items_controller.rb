class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index_edit, only: [:edit]

  def index
    @items = Item.all.order(id: :desc)
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

  def show
  end

  def edit
  end

  def update
     if @item.update(item_params)
       redirect_to item_path(@item)  
     else
      render :edit
     end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :category_id, :shipping_cost_id, :shipping_day_id,
                                 :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index_edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
