class Item < ApplicationRecord

  with_options presence: true do
    validates :product
    validates :content
    validates :category_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :postage_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999 }
    validates :images, length: { minimum: 1, maximum: 5 }
  end

  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_one    :order, dependent: :destroy
  # has_many :reviews

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :delivery_day
end