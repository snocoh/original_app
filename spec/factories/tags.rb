FactoryBot.define do
  factory :tag do
    tag_name { Faker::Name.initials }
  end
end