class BuyersController < ApplicationController
    def index
        @item = Item.find(params[:item_id])
        @buyer_address = BuyerAddress.new
    end

    def create
        @buyer_address = BuyerAddress.new(buyer_params)
        if @buyer_address.valid?
           @buyer_address.save
           redirect_to root_path
        else
           @item = Item.find(params[:item_id])
           render :index
        end
    end

    private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :buyer_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
