class BuyersController < ApplicationController
  before_action :set_item

    def index
        @item = Item.find(params[:item_id])
        @buyer_address = BuyerAddress.new
    end

    def create
        @buyer_address = BuyerAddress.new(buyer_params)
        if @buyer_address.valid?
           pay_item
           @buyer_address.save
           redirect_to root_path
        else
           @item = Item.find(params[:item_id])
           render :index
        end
    end

    private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :buyer_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_8ad547c5bd5d88e161b83193"
          Payjp::Charge.create(
          amount: @item.price,  
          card: buyer_params[:token],   
          currency: 'jpy'
      )
  end
end
