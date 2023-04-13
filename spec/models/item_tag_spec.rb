require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  let(:item_tag) { FactoryBot.build(:item_tag) }

  context '登録できる場合' do
    it 'item_idとtag_idがあれば登録できる' do
      expect(item_tag).to be_valid
    end

  end

  context '登録できない場合' do

    it 'itemが紐づいていない場合、登録できない' do
      item_tag.item = nil
      item_tag.valid?
      expect(item_tag.errors.full_messages).to include('Item must exist')
    end

    it 'tagが紐づいていない場合、登録できない' do
      item_tag.tag = nil
      item_tag.valid?
      expect(item_tag.errors.full_messages).to include('Tag must exist')
    end

  end
end