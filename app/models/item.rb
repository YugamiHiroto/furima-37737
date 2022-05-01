class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_cost
    belongs_to :shipping_day
    belongs_to :prefecture

    belongs_to :user

    has_one_attached :image

    validates :name, presence: true
    validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :description, presence: true
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :image, presence: true
end
