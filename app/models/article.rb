class Article < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category

    validates :genre_id, numericality: { other_than: 1 } 
end
