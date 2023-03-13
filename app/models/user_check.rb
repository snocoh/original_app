class UserCheck < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '出品者' },
    { id: 3, name: '購入者' },
  ]

  include ActiveHash::Associations
  has_many :users
end