class Postage < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '送料別' },
    { id: 3, name: '送料込み' }
  ]

  include ActiveHash::Associations
  has_many :items
end
