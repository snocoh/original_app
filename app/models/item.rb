class Item < ApplicationRecord

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