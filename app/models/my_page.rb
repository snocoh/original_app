class MyPage < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :profile
    validates :age_id, numericality: { other_than: 1}
    validates :prefecture_id, numericality: { other_than: 1}
  end

  belongs_to :user
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :prefecture
end
