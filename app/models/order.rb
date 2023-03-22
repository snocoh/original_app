class Order < ApplicationRecord
  
  belongs_to :user
  belongs_to :item
  # belongs_to :my_page
  has_one    :address, dependent: :destroy
end
