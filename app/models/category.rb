class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '陶磁器' },
    { id: 3, name: '織物' },
    { id: 4, name: '染物' },
    { id: 5, name: '木漆工' },
    { id: 6, name: '金工' },
    { id: 7, name: '石工' },
    { id: 8, name: '竹工' },
    { id: 9, name: '紙工' },
    { id: 10, name: '革工' },
    { id: 11, name: 'ガラス' },
    { id: 12, name: '彫刻' },
    { id: 13, name: '編組品' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
