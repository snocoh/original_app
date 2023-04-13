FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { 'ab12' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    user_check_id { Faker::Number.between(from: 2, to: 3) }
  end
end
