FactoryBot.define do
  factory :item do
    product { Faker::Name.name }
    content { Faker::Quote.famous_last_words }
    category_id { Faker::Number.between(from: 2, to: 14) }
    postage_id { Faker::Number.between(from: 2, to: 3) }
    delivery_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 0, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
      build_list(:item_tag, 1, item: item, tag: build(:tag))
    end

  end
end
