class ItemTag < ApplicationRecord
  belongs_to :item, dependent: :destroy
  belongs_to :tag, dependent: :destroy
end
