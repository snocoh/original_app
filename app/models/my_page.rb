class MyPage < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :profile
    validates :age_id, numericality: { other_than: 1}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :image
  end

  # モデル登録時・place変更時に、緯度・経度データ登録・更新
  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :prefecture
end
