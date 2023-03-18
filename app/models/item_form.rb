class ItemForm
  include ActiveModel::Model
  #ItemFormクラスのオブジェクトがItemモデルの属性を扱えるようにする
  attr_accessor :product, :content, :category_id, :postage_id,:delivery_day_id, :price, :user_id, :images,
                :tag_name,
                :id, :created_at, :updated_at

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
    item = Item.create(product: product, content: content, category_id: category_id, postage_id: postage_id, delivery_day_id: delivery_day_id, price: price, user_id: user_id, images: images)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTag.create(item_id: item.id, tag_id: tag.id)
    end
  end

  # controllerで呼び出したupdateメソッドから引数を受け取る
  def update(params, item)
    # 一度タグの紐づけを消す
    item.item_tags.destroy_all
    # params内のタグ情報削除
    tag_name = params.delete(:tag_name)
    
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    tag.save if tag_name.present?
    item.update(params)
    ItemTag.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end

end