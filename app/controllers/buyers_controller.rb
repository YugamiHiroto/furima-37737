class BuyersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

    def index
        @item = Item.find(params[:item_id])
        @buyer_address = BuyerAddress.new

        if @item.buyer.present?
          redirect_to root_path 
        end
        if current_user == @item.user
          redirect_to root_path
        end

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  
    card: buyer_params[:token],   
    currency: 'jpy'
  )
  end
end
