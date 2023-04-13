require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.build(:item) }

  describe '商品出品' do
    context '商品が出品できる場合' do

      it '全項目埋まっていれば登録できる' do
        expect(item).to be_valid
      end
      
      it 'tagは空でも保存できる' do
        item.tag_ids = ''
        expect(item).to be_valid
      end
    end

    context '商品が出品できない場合' do

      it 'imageが空では登録できない' do
        item.images = nil
        item.valid?
        expect(item.errors.full_messages).to include("Images can't be blank")
      end

      it 'productが空では登録できない' do
        item.product = ''
        item.valid?
        expect(item.errors.full_messages).to include("Product can't be blank")
      end

      it 'contentが空では登録できない' do
        item.content = ''
        item.valid?
        expect(item.errors.full_messages).to include("Content can't be blank")
      end

      it 'categoryが空では登録できない' do
        item.category_id = '1'
        item.valid?
        expect(item.errors.full_messages).to include("Category cant't be blank")
      end

      it 'postageが空では登録できない' do
        item.postage_id = '1'
        item.valid?
        expect(item.errors.full_messages).to include("Postage cant't be blank")
      end

      it 'delivery_dayが空では登録できない' do
        item.delivery_day_id = '1'
        item.valid?
        expect(item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では登録できない' do
        item.price = ''
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが9999999以上では登録できない' do
        item.price = '10000000'
        item.valid?
        expect(item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceは半角数字でなければ登録できない' do
        item.price = '３００'
        item.valid?
        expect(item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐づいていなければ登録できない' do
        item.user = nil
        item.valid?
        expect(item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
