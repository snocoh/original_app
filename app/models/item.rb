class Item < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :content
    validates :category_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :postage_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999 }
    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  end
  
  belongs_to :user
  has_many_attached :images
  # belongs_to :my_page
  # has_one    :order
  # has_many :reviews
  # has_many :tags
  # has_many :item_tag_relations

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  # belongs_to :postage
  # belongs_to :delivery_day
end