class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_cost
    belongs_to :shipping_day
    belongs_to :prefecture

    has_one_attached :image

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture, numericality: { other_than: 0 , message: "can't be blank"}

end
