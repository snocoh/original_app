class Tag < ApplicationRecord

  validates :tag_name, uniqueness: true, presence: true

  has_many :item_tags
  has_many :items, through: :item_tags
end
