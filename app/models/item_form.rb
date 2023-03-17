class ItemForm
  include ActiveModel::Model
  #ItemFormクラスのオブジェクトがItemモデルの属性を扱えるようにする
  attr_accessor :product, :content, :category_id, :postage_id,:delivery_day_id, :price, :user_id, :images

  with_options presence: true do
    validates :product
    validates :content
    validates :category_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :postage_id, numericality: { other_than: 1, message: "cant't be blank" }
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999 }
    validates :images, length: { minimum: 1, maximum: 5 }
    validates :user_id
  end

  def save
    Item.create(product: product, content: content, category_id: category_id, postage_id: postage_id, delivery_day_id: delivery_day_id, price: price, user_id: user_id, images: images)
  end
end