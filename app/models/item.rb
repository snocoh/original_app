class Item < ApplicationRecord

  belongs_to :user
  has_many_attached :images
  has_many :item_tags
  has_many :tags, through: :item_tags
  # belongs_to :my_page
  has_one    :order
  # has_many :reviews

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :postage
  belongs_to :delivery_day
end