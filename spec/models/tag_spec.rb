require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.build(:tag) }

  context '登録できる場合' do

    it 'tag_nameがある場合、登録できる' do
      expect(tag).to be_valid
    end

  end

  context '登録できない場合' do

    it 'tag_nameがない場合、登録できない' do
      tag.tag_name = ''
      tag.valid?
      expect(tag.errors.full_messages).to include("Tag name can't be blank")
    end

    it 'tag_nameが一意ではない場合、登録できない' do
      tag.save
      another_tag = FactoryBot.build(:tag)
      another_tag.tag_name = tag.tag_name
      another_tag.valid?
      expect(another_tag.errors.full_messages).to include("Tag name has already been taken")
    end

  end
end

    
