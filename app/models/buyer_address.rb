class BuyerAddress

    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id , :item_id
  
    with_options presence: true do
      validates :user_id, :item_id, :address, :city, :address
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :phone_number,format: {with: /^(0{1}\d{9,10})$/, message: "is invalid."}
    end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
    end
  end